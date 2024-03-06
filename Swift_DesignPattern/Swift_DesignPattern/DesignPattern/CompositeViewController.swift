//
//  CompositeViewController.swift
//  Swift_DesignPattern
//
//  Created by 강창현 on 3/6/24.
//

import UIKit

/*
 Composite (컴포지트) 패턴:
 - 개별 객체와 복합 객체를 동일한 인터페이스로 다루기 위한 패턴.
 장점:
 - 단일 및 복합 객체를 일관된 방식으로 다룰 수 있음.
 - 새로운 구성 요소를 쉽게 추가할 수 있음.
 단점:
 - 모든 객체가 동일한 인터페이스를 갖기 때문에 구체적인 구현의 세부사항을 숨기기 어려울 수 있음.
*/

final class DataFetcherGroup: DataFetcher {
    private var dataFetchers: [DataFetcher] = []

    func add(dataFetcher: DataFetcher) {
        dataFetchers.append(dataFetcher)
    }

    func fetchData(completion: @escaping (UIImage) -> Void) {
        print("그룹으로부터 데이터 패치 중!")
        for dataFetcher in dataFetchers {
            dataFetcher.fetchData(completion: completion)
        }
    }
}

final class CompositeNetworkManager: DataFetcher {
    private let catUrlString = "https://api.nudge-community.com/attachments/35176"
    func fetchData(completion: @escaping (UIImage) -> Void) {
        guard let url = URL(string: catUrlString) else {
            print("Failed to create URL")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Failed to load image: \(error.localizedDescription)")
                return
            }
            
            guard
                let data = data,
                let image = UIImage(data: data)
            else {
                print("Failed to convert data to image")
                return
            }
            
            DispatchQueue.main.async {
                completion(image)
            }
        }
        task.resume()
    }
}

final class CompositeViewController: UIViewController {
    @IBOutlet weak var catImageView: UIImageView!
    private let networkManager = NetworkManager()
    private let compositNetworkManager = CompositeNetworkManager()
    private let dataFetcherGroup = DataFetcherGroup()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataFetcherGroup.add(dataFetcher: networkManager)
        dataFetcherGroup.add(dataFetcher: compositNetworkManager)
    }
    
    @IBAction func showButtonTapped(_ sender: UIButton) {
        dataFetcherGroup.fetchData { [weak self] image in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self?.catImageView.image = image
            }
        }
    }
}
