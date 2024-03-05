//
//  ViewController.swift
//  Swift_DesignPattern
//
//  Created by 강창현 on 3/6/24.
//

import UIKit

class NetworkManager {
    func fetchData(completion: @escaping (String) -> Void) {
        // 네트워크 요청 로직 (예시로 문자열을 받아온다고 가정)
        // completion("Data received from the server")
    }
}

class ViewController: UIViewController {
    let networkManager = NetworkManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.fetchData { data in
            print(data)
        }
    }
}

