//
//  AdapterViewController.swift
//  Swift_DesignPattern
//
//  Created by 강창현 on 3/6/24.
//

import UIKit
// Target 인터페이스
protocol DataFetcher {
    func fetchData(completion: @escaping (String) -> Void)
}

// Adaptee 클래스
//class NetworkManager {
//    func fetchData(completion: @escaping (String) -> Void) {
//        // 네트워크 요청 로직 (예시로 문자열을 받아온다고 가정)
//        // completion("Data received from the server")
//    }
//}

// Adapter 클래스
class DataFetcherAdapter: DataFetcher {
    private let networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    func fetchData(completion: @escaping (String) -> Void) {
        networkManager.fetchData(completion: completion)
    }
}

final class AdapterViewController: UIViewController {
    let dataFetcher: DataFetcher = DataFetcherAdapter(networkManager: NetworkManager())

    override func viewDidLoad() {
        super.viewDidLoad()

        dataFetcher.fetchData { data in
            print(data)
        }
    }
}
