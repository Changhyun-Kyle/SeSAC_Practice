//
//  AdapterViewController.swift
//  Swift_DesignPattern
//
//  Created by 강창현 on 3/6/24.
//

import UIKit

/*
 Adapter (어댑터) 패턴:
 - 서로 다른 인터페이스를 가진 클래스들을 함께 동작할 수 있게 연결하는 패턴.
 장점:
 - 코드 재사용 및 유연성 증가.
 - 기존 코드 수정 없이 새로운 코드를 통합 가능.
 단점:
 - 지나친 어댑터 사용은 코드 복잡성을 증가시킬 수 있음.
 */

protocol DataFetcher {
    func fetchData(completion: @escaping (UIImage) -> Void)
}

final class DataFetcherAdapter: DataFetcher {
    private let networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    func fetchData(completion: @escaping (UIImage) -> Void) {
        networkManager.fetchData(completion: completion)
    }
}

final class AdapterViewController: UIViewController {
    @IBOutlet weak var catImageView: UIImageView!
    private let dataFetcher: DataFetcher = DataFetcherAdapter(networkManager: NetworkManager())

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showButtonTapped(_ sender: UIButton) {
        dataFetcher.fetchData { [weak self] image in
            self?.catImageView.image = image
        }
    }
}
