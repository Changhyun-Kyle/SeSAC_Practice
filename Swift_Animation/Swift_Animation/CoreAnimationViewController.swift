//
//  CoreAnimationViewController.swift
//  Swift_Animation
//
//  Created by 강창현 on 3/18/24.
//

import UIKit

final class CoreAnimationViewController: UIViewController {
    private let myLayer: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.red.cgColor
        layer.cornerRadius = 50
        layer.frame = CGRect(x: 150, y: 300, width: 100, height: 100)
        return layer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.addSublayer(myLayer)
//        myAnimation()
        myAnimation2()
    }
    
    private func myAnimation() {
        let animation: CABasicAnimation = CABasicAnimation()
        animation.keyPath = "position.x"
        animation.fromValue = 77
        animation.toValue = 350
        animation.duration = 1
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = true
        animation.autoreverses = true
        myLayer.add(animation, forKey: "basic")
    }
    
    private func myAnimation2() {
        let animation: CAKeyframeAnimation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [ 
            0,
            10,
            -10,
            10,
            0
        ]
        animation.keyTimes = [
            0, 
            NSNumber(value: 1 / 6.0),
            NSNumber(value: 3 / 6.0),
            NSNumber(value: 5 / 6.0),
            1
        ]
        animation.duration = 0.4
        animation.repeatCount = 20
        animation.isAdditive = true
        myLayer.add(animation, forKey: "shake")
    }
}
