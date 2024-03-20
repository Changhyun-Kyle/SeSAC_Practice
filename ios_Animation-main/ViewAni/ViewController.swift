//
//  ViewAni - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var comeOnButton: UIButton!
    @IBOutlet weak var comeOnButton2: UIButton!
    lazy var left: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .systemPink
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
        return view
    }()
    
    lazy var right: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .systemPink
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
        return view
    }()
    
    lazy var line: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityAttributedLabel = .init(string: "line")
        view.alpha = 0
        self.view.addSubview(view)
        return view
    }()
    
    lazy var spider: UIView = {
        let view = UIImageView(image: .init(named: "spider"))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityAttributedLabel = .init(string: "spider")
        view.alpha = 0
        self.view.addSubview(view)
        return view
    }()
    
    @IBOutlet var spider2: UIImageView?
    
    lazy var safe = view.safeAreaLayoutGuide
    var top: NSLayoutConstraint?
    var lineCon: NSLayoutConstraint?
    var constraints: [NSLayoutConstraint] = []
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        constraints.append(contentsOf: [
            line.centerXAnchor.constraint(equalTo: safe.centerXAnchor),
            line.widthAnchor.constraint(equalToConstant: 2),
            line.topAnchor.constraint(equalTo: safe.topAnchor),
            line.bottomAnchor.constraint(equalTo: spider.topAnchor),
            line.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),
            
            spider.widthAnchor.constraint(equalTo: safe.widthAnchor, multiplier: 0.2),
            spider.heightAnchor.constraint(equalTo: spider.widthAnchor),
            spider.centerXAnchor.constraint(equalTo: safe.centerXAnchor),
                        
            left.widthAnchor.constraint(equalTo: safe.widthAnchor, multiplier: 0.25),
            left.heightAnchor.constraint(equalTo: safe.heightAnchor, multiplier: 0.5),
            left.topAnchor.constraint(equalTo: safe.topAnchor),
            left.trailingAnchor.constraint(equalTo: safe.centerXAnchor),
            
            right.widthAnchor.constraint(equalTo: safe.widthAnchor, multiplier: 0.25),
            right.heightAnchor.constraint(equalTo: safe.heightAnchor, multiplier: 0.5),
            right.topAnchor.constraint(equalTo: safe.topAnchor),
            right.leadingAnchor.constraint(equalTo: safe.centerXAnchor),
            comeOnButton.topAnchor.constraint(equalTo: left.bottomAnchor, constant: 30),
            comeOnButton.leadingAnchor.constraint(equalTo: safe.leadingAnchor, constant: 50),
            comeOnButton.trailingAnchor.constraint(equalTo: safe.trailingAnchor, constant: -50),
            comeOnButton2.topAnchor.constraint(equalTo: spider2!.bottomAnchor, constant: 30),
            comeOnButton2.leadingAnchor.constraint(equalTo: safe.leadingAnchor, constant: 50),
            comeOnButton2.trailingAnchor.constraint(equalTo: safe.trailingAnchor, constant: -50)
        ])
        
        top = spider.topAnchor.constraint(equalTo: safe.topAnchor, constant: 0)
        
        NSLayoutConstraint.activate(constraints + [top!])
        
        constraints.forEach {
            $0.priority = $0.firstAttribute == .width ? .required : .defaultHigh
        }
    }
    
    @IBAction func touchUpAnimationButton() {
        UIView.animateKeyframes(withDuration: 2.0, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.left.frame.origin.x -= 100
                self.right.frame.origin.x += 100
            }
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.spider.alpha = 1
                self.spider.frame.origin.y += self.left.frame.height / 2
                self.line.alpha = 1
                self.line.frame.size.height += self.left.frame.height / 2
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.75) {
                self.spider.frame.origin.y -= self.left.frame.height / 2
                self.line.frame.size.height -= self.left.frame.height / 2
            }
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 1) {
                self.spider.alpha = 0
                self.line.alpha = 0
            }
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 1) {
                self.left.frame.origin.x += 100
                self.right.frame.origin.x -= 100
            }
        }
    }
}

