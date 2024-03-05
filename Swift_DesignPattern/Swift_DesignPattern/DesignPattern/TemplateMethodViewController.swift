//
//  TemplateMethodViewController.swift
//  Swift_DesignPattern
//
//  Created by 강창현 on 3/6/24.
//

import UIKit

class DataFetcherTemplate {
    final func fetchData(completion: @escaping (String) -> Void) {
        requestFromServer(completion: completion)
        processData()
    }

    func requestFromServer(completion: @escaping (String) -> Void) {
        fatalError("requestFromServer must be overridden by subclasses")
    }

    func processData() {
        print("Processing data")
    }
}

class TempleteNetworkManager: DataFetcherTemplate {
    override func requestFromServer(completion: @escaping (String) -> Void) {
        // 네트워크 요청 로직 (예시로 문자열을 받아온다고 가정)
        // completion("Data received from the server")
    }

    override func processData() {
        print("Processing data received from the server")
    }
}

final class TemplateMethodViewController: UIViewController {
    let networkManager = TempleteNetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        networkManager.fetchData { data in
            print(data)
        }
    }
}
