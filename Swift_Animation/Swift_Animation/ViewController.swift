//
//  ViewController.swift
//  Swift_Animation
//
//  Created by 강창현 on 3/18/24.
//

import UIKit

final class ViewController: UIViewController {

    private let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let cyankView: UIView = {
        let view = UIView()
        view.backgroundColor = .cyan
        return view
    }()
    
    private let animationButton: UIButton = {
        let button = UIButton(configuration: .tinted())
        button.setTitle("Animate!", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBlackView()
        configureCyanView()
        configureButton()
    }
}

private extension ViewController {
    func configureBlackView() {
        self.view.addSubview(blackView)
        blackView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        blackView.center = view.center
    }
    
    func configureCyanView() {
        self.blackView.addSubview(cyankView)
        cyankView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
    }
    
    func configureButton() {
        self.view.addSubview(animationButton)
        animationButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            animationButton.heightAnchor.constraint(equalToConstant: 100),
            animationButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        let action = UIAction { [weak self] _ in
            self?.tappedAnimateButton()
        }
        animationButton.addAction(action, for: .touchUpInside)
    }
    
    func tappedAnimateButton() {
        UIView.animate(withDuration: 1, delay: 1, options: .autoreverse) {
            
        }
//        UIView.animate(
//            withDuration: 0.6, 
//            delay: 0.0
//        ) {
//            self.cyankView.frame.origin.x += 100
//        } completion: { _ in
//            UIView.animate(
//                withDuration: 0.6,
//                delay: 0.0
//            ) {
//                self.cyankView.frame.origin.y += 100
//            } completion: { _ in
//                UIView.animate(
//                    withDuration: 0.6,
//                    delay: 0.0
//                ) {
//                    self.cyankView.frame.origin.x -= 100
//                } completion: { _ in
//                    UIView.animate(
//                        withDuration: 0.6,
//                        delay: 0.0
//                    ) {
//                        self.cyankView.frame.origin.y -= 100
//                    }
//                }
//            }
//        }
        UIView.animateKeyframes(withDuration: 2.4, delay: 0) {
            UIView.addKeyframe(
                withRelativeStartTime: 0,
                relativeDuration: 0.25
            ) {
                self.cyankView.transform = CGAffineTransform(a: 10, b: 10, c: 10, d: 10, tx: 10, ty: 10)
            }
//            UIView.addKeyframe(
//                withRelativeStartTime: 0.25,
//                relativeDuration: 0.5
//            ) {
//                self.cyankView.frame.origin.y += 100
//            }
//            UIView.addKeyframe(
//                withRelativeStartTime: 0.5,
//                relativeDuration: 0.75
//            ) {
//                self.cyankView.frame.origin.x -= 100
//            }
//            UIView.addKeyframe(
//                withRelativeStartTime: 0.75,
//                relativeDuration: 1
//            ) {
//                self.cyankView.frame.origin.y -= 100
//            }
        }
    }
}

