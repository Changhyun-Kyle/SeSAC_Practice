//
//  CompositeViewController.swift
//  Swift_DesignPattern
//
//  Created by 강창현 on 3/6/24.
//

import UIKit
// Component

// Leaf
class CompositeNetworkManager: DataFetcher {
    func fetchData(completion: @escaping (String) -> Void) {
        // 네트워크 요청 로직 (예시로 문자열을 받아온다고 가정)
        // completion("Data received from the server")
    }
}

// Composite
class DataFetcherGroup: DataFetcher {
    private var dataFetchers: [DataFetcher] = []

    func add(dataFetcher: DataFetcher) {
        dataFetchers.append(dataFetcher)
    }

    func fetchData(completion: @escaping (String) -> Void) {
        print("Fetching data from a group of sources")
        for dataFetcher in dataFetchers {
            dataFetcher.fetchData(completion: completion)
        }
    }
}
final class CompositeViewController: UIViewController {
    let networkManager = CompositeNetworkManager()
    let dataFetcherGroup = DataFetcherGroup()

    override func viewDidLoad() {
        super.viewDidLoad()

        dataFetcherGroup.add(dataFetcher: networkManager)

        dataFetcherGroup.fetchData { data in
            print(data)
        }
    }
}
