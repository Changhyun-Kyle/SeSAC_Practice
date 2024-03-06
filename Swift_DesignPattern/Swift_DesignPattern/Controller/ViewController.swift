//
//  ViewController.swift
//  Swift_DesignPattern
//
//  Created by 강창현 on 3/6/24.
//

import UIKit

final class NetworkManager: NetworkService, DataFetcher {
    func requestData(completion: @escaping (UIImage) -> Void) {
        fetchData(completion: completion)
    }
    
    private let catUrlString = "https://i.kym-cdn.com/entries/icons/facebook/000/046/895/huh_cat.jpg"
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

final class ViewController: UIViewController {
    @IBOutlet weak var catImageView: UIImageView!
    private let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showButtonTapped(_ sender: UIButton) {
        networkManager.fetchData { [weak self] image in
            self?.catImageView.image = image
        }    
    }
}

