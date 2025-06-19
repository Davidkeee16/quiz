//
//  moveInStackView.swift
//  quizeLecture
//
//  Created by David Puksanskis on 18/06/2025.
//

import Foundation
import UIKit


struct MoveInStackView {
    
    
    static func inside(stackView: UIStackView, buttons: [UIButton]) {
        
        for button in buttons {
            stackView.addArrangedSubview(button)
        }
    }
}
