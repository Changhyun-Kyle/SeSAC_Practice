//
//  CustomView.swift
//  Swift_ViewDrawingCycle
//
//  Created by 강창현 on 3/11/24.
//

import UIKit

final class CustomView: UIView {
//    override class var requiresConstraintBasedLayout: Bool
//    override var intrinsicContentSize: CGSize
    override func updateConstraints() {
        super.updateConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func setNeedsDisplay() {
        super.setNeedsDisplay()
    }
    
    override func setNeedsDisplay(_ rect: CGRect) {
        super.setNeedsDisplay(rect)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
}
