//
//  ViewController.swift
//  UIKit_Programatically
//
//  Created by 강창현 on 2/6/24.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "NEXT"
        button.backgroundColor = .systemPink
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

