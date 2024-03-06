//
//  BridgeViewController.swift
//  Swift_DesignPattern
//
//  Created by 강창현 on 3/6/24.
//

import UIKit

/*
 Bridge (브리지) 패턴:
 - 추상화된 인터페이스와 구현을 분리하여 두 개를 독립적으로 변화할 수 있도록 하는 패턴.
 장점:
 - 강한 결합을 피하고 더 나은 확장성과 유지보수성 제공.
 - 추상화를 통해 코드의 유연성 증가.
 단점:
 - 추가적인 추상화로 인해 복잡성이 증가할 수 있음.
*/

protocol NetworkService {
    func requestData(completion: @escaping (UIImage) -> Void)
}

final class DataFetcherBridge: DataFetcher {
    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func fetchData(completion: @escaping (UIImage) -> Void) {
        networkService.requestData(completion: completion)
    }
}

final class BridgeViewController: UIViewController {
    @IBOutlet weak var catImageView: UIImageView!
    private let dataFetcher: DataFetcher = DataFetcherBridge(networkService: NetworkManager())

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showButtonTapped(_ sender: UIButton) {
        dataFetcher.fetchData { [weak self] image in
            self?.catImageView.image = image
        }
    }
}
