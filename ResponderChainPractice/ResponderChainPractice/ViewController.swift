//
//  ViewController.swift
//  ResponderChainPractice

import UIKit

class ViewController: UIViewController {
    //MARK: - part1
    @IBOutlet private var directionLabel: UILabel!
    
    //MARK: - part2
    @IBOutlet weak var positionLabel: UILabel!
    
//    private lazy var tapGestureRecognizer = UITapGestureRecognizer(
//        target: self,
//        action: #selector(tapGestureRecognized)
//    )
//    
//    private lazy var panGestureRecognizer = UIPanGestureRecognizer(
//        target: self,
//        action: #selector(panGestureRecognized)
//    )
//    
//    private lazy var leftGestureRecgnizer = UISwipeGestureRecognizer(
//        target: self,
//        action: #selector(leftGestureRecognized)
//    )
//    
//    private lazy var rightGestureRecgnizer = UISwipeGestureRecognizer(
//        target: self,
//        action: #selector(rightGestureRecognized)
//    )
    
    private var point: CGPoint = .init(x: 0.0, y: 0.0) 
//    {
//        didSet {
//            let direction = oldValue.x < point.x ? "오른쪽" : "왼쪽"
//            directionLabel.text = direction
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    //MARK: - Gesture Recognizer
        
//        leftGestureRecgnizer.direction = UISwipeGestureRecognizer.Direction.left
//        rightGestureRecgnizer.direction = UISwipeGestureRecognizer.Direction.right
//        
//        view.addGestureRecognizers(
//            tapGestureRecognizer,
//            panGestureRecognizer,
//            leftGestureRecgnizer,
//            rightGestureRecgnizer
//        )
    }
    
    @objc private func tapGestureRecognized(_ gesture: UITapGestureRecognizer) {
//        print("tapGestureRecognized")
//        point = gesture.location(in: view)
//        positionLabel.text =  "x: \(point.x), y: \(point.y)"
    }

    @objc private func panGestureRecognized(_ gesture: UIPanGestureRecognizer) {
//        point = gesture.location(in: view)
//        positionLabel.text = "x: \(point.x), y: \(point.y)"
    }

    @objc private func leftGestureRecognized(_ gesture: UISwipeGestureRecognizer) {
        
    }

    @objc private func rightGestureRecognized(_ gesture: UISwipeGestureRecognizer) {
        
    }
    
    //MARK: - Touch Event Handling
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        point = touch.location(in: view)
        let previousLocation = touch.previousLocation(in: view)
        directionLabel.text = previousLocation.x < point.x ? "오른쪽" : "왼쪽"
        positionLabel.text = "x: \(point.x), y: \(point.y)"
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("cancel!")
    }
}

extension UIView {
    func addGestureRecognizers(_ gestureRecognizers: UIGestureRecognizer...) {
        for gestureRecognizer in gestureRecognizers {
            self.addGestureRecognizer(gestureRecognizer)
        }
    }
}
