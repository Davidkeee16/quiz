//
//  UIStackView + Extension.swift
//  quizeLecture
//
//  Created by David Puksanskis on 25/06/2025.
//

import Foundation
import UIKit


extension UIStackView {
    
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        
        self.axis = axis
        self.spacing = spacing
    }
}

