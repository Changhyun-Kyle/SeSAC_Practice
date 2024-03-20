//
//  CoregraphicsViewController.swift
//  ViewAni
//
//  Created by 강창현 on 3/18/24.
//

import UIKit

final class CoregraphicsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

final class myView: UIView {
    private let lineWidth: CGFloat = 10
    override func draw(_ rect: CGRect) {
        guard 
            let myContext = UIGraphicsGetCurrentContext()
        else {
            return
        }
        
        let height = bounds.height
        let width = bounds.width
        
        myContext.beginPath()
        myContext.setLineWidth(lineWidth)
        myContext.addEllipse(
            in: CGRect(
                origin: CGPoint(
                    x: 50,
                    y: 80
                ),
                size: CGSize(
                    width: 200,
                    height: 200
                )
            )
        )
        myContext.addLine(
            to: CGPoint(
                x: 50 + width / 2,
                y: 80 + height / 2
            )
        )
        myContext.drawPath(using: .stroke)
    }
}
