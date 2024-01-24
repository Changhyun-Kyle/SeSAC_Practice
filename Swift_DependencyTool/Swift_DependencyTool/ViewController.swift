//
//  ViewController.swift
//  Swift_DependencyTool
//
//  Created by 강창현 on 1/22/24.
//

import UIKit
import Lottie

final class ViewController: UIViewController {
    private let animationView = LottieAnimationView(name: "Animation - 1705897766942")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(animationView)
        animationView.frame = view.bounds
//        animationView.loopMode = .playOnce
        animationView.play { completed in
            self.animationView.removeFromSuperview()
        }
    }
}
// MARK: - 내용
// TODO: - 할 일 목록
// FIXME: - 에러처리


