//
//  BridgeViewController.swift
//  Swift_DesignPattern
//
//  Created by 강창현 on 3/6/24.
//

import UIKit
// Abstraction
//protocol DataFetcher {
//    func fetchData(completion: @escaping (String) -> Void)
//}

// Implementor
protocol NetworkService {
    func requestData(completion: @escaping (String) -> Void)
}

// Concrete Implementor
class BridgeNetworkManager: NetworkService {
    func requestData(completion: @escaping (String) -> Void) {
        // 네트워크 요청 로직 (예시로 문자열을 받아온다고 가정)
        // completion("Data received from the server")
    }
}

// Refined Abstraction
class DataFetcherBridge: DataFetcher {
    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func fetchData(completion: @escaping (String) -> Void) {
        networkService.requestData(completion: completion)
    }
}

final class BridgeViewController: UIViewController {
    let dataFetcher: DataFetcher = DataFetcherBridge(networkService: BridgeNetworkManager())

    override func viewDidLoad() {
        super.viewDidLoad()

        dataFetcher.fetchData { data in
            print(data)
        }
    }
}
