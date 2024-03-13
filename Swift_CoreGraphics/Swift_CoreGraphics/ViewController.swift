//
//  ViewController.swift
//  Swift_CoreGraphics
//
//  Created by 강창현 on 3/13/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpButton(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
}

class MyView: UIView {
    var fillColor: UIColor = UIColor.lightGray
    var lineWidth: CGFloat = 0
    
    override func draw(_ rect: CGRect) {
        guard let myContext = UIGraphicsGetCurrentContext() else {
            return
        }
        
        let height = bounds.height
        let width = bounds.width
        
        myContext.beginPath()
        myContext.setLineWidth(lineWidth)
        myContext.setFillColor(UIColor.darkGray.cgColor)
        myContext.fill(bounds)
        
        myContext.setFillColor(fillColor.cgColor)
        myContext.move(
            to: CGPoint(
                x: 0,
                y: height * 0.6
            )
        )
        myContext.addCurve(
            to: CGPoint(
                x: width * 0.5,
                y: height * 0.4
            ),
            control1: CGPoint(
                x: width * 0.1,
                y: height * 0.2
            ),
            control2: CGPoint(
                x: width * 0.3,
                y: height * 1.1
            )
        )
        
        myContext.addQuadCurve(
            to: CGPoint(
                x: width,
                y: height * 0.7
            ),
            control: CGPoint(
                x: width * 0.65,
                y: height * -0.1
            )
        )
        
        myContext.addLine(
            to: CGPoint(
                x: width,
                y: height
            )
        )
        myContext.addLine(
            to: CGPoint(
                x: 0,
                y: height
            )
        )
        myContext.addLine(
            to: CGPoint(
                x: 0,
                y: height * 0.6
            )
        )
        
        myContext.addEllipse(
            in: CGRect(
                origin: CGPoint(
                    x: width * 0.25,
                    y: height * 0.35
                ),
                size: CGSize(
                    width: width * 0.1,
                    height: width * 0.1
                )
            )
        )
        myContext.drawPath(using: .fillStroke)
    }
}



// inset vs offset, bounds vs frame
class MyButton: UIButton {
    override func draw(_ rect: CGRect) {
        guard let myContext: CGContext = UIGraphicsGetCurrentContext() else { return }
        // ********** Your drawing code here **********
        //        myContext.setFillColor (red: 1, green: 0, blue: 0, alpha: 1)
        //        myContext.fill (CGRectMake (0, 0, 200, 100 ))
        //        myContext.setFillColor (red: 0, green: 0, blue: 1, alpha: 0.5)
        //        myContext.fill (CGRectMake (0, 0, 100, 200))
        
        let circleRect: CGRect = bounds.insetBy(dx: 10, dy: 10)
        myContext.beginPath()
        myContext.setLineWidth(5)
        myContext.setStrokeColor(UIColor.black.cgColor)
        myContext.setFillColor(UIColor.systemPink.cgColor)
        myContext.addEllipse(in: circleRect)
        myContext.drawPath(using: .fillStroke)
        if isSelected {
            let width: CGFloat = bounds.width
            let height: CGFloat = bounds.height
            
            myContext.move(
                to: CGPoint(
                    x: width * 0.1,
                    y: height * 0.5
                )
            )
            myContext.addQuadCurve(
                to: CGPoint(
                    x: width * 0.9,
                    y: height * 0.1
                ),
                control: CGPoint(
                    x: width * 0.4,
                    y: height * 1.3
                )
            )
            myContext.drawPath(using: .stroke)
        }
    }
}
