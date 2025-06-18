//
//  Button + Extension.swift
//  quizeLecture
//
//  Created by David Puksanskis on 18/06/2025.
//

import Foundation
import UIKit

extension UIButton {
    
    convenience init(title: String, titleColor: UIColor, border: CGColor, shadowColor: CGColor) {
        self.init(type: .system)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.layer.borderColor = border
        self.layer.shadowColor = shadowColor
    }
}
