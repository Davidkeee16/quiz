//
//  Button + Extension.swift
//  quizeLecture
//
//  Created by David Puksanskis on 18/06/2025.
//

import Foundation
import UIKit

extension UIButton {
    
    convenience init(title: String, titleColor: UIColor = .systemBlue, borderWidth: CGFloat = 2, borderColor: CGColor = UIColor.systemBlue.cgColor) {
        self.init(type: .system)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        
        
    }
    
}
