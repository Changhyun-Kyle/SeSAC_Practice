//
//  TemplateMethodViewController.swift
//  Swift_DesignPattern
//
//  Created by 강창현 on 3/6/24.
//

import UIKit

/*
 Template Method (템플릿 메소드) 패턴:
 - 알고리즘의 뼈대를 정의하고 일부 단계를 서브클래스에 위임하여 알고리즘의 일부를 변경할 수 있게 하는 패턴.
 장점:
 - 알고리즘의 일부를 재사용하면서 일부를 변경할 수 있음.
 - 코드 중복을 방지하고 유지보수성 향상.
 단점:
 - 일부 메소드의 구현이 고정되어 있어 유연성이 부족할 수 있음.
*/

class DataFetcherTemplate {
    final func fetchData(completion: @escaping (UIImage) -> Void) {
        requestFromServer(completion: completion)
        processData()
    }

    func requestFromServer(completion: @escaping (UIImage) -> Void) {
        fatalError("requestFromServer must be overridden by subclasses")
    }

    func processData() {
        print("데이터 패치 중!")
    }
}

final class TempleteNetworkManager: DataFetcherTemplate {
    private let catUrlString = "https://api.nudge-community.com/attachments/35176"
    override func requestFromServer(completion: @escaping (UIImage) -> Void) {
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

    override func processData() {
        print("서버로 부터 데이터 로드 중")
    }
}

final class TemplateMethodViewController: UIViewController {
    @IBOutlet weak var catImageView: UIImageView!
    private let networkManager = TempleteNetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showButtonTapped(_ sender: UIButton) {
        networkManager.fetchData { [weak self] image in
            self?.catImageView.image = image
        }
    }
}
