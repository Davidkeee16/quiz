//
//  moveInStackView.swift
//  quizeLecture
//
//  Created by David Puksanskis on 18/06/2025.
//

import Foundation
import UIKit


class MoveInStackView: UIView {
    
    
    static func forSingleAnswer(stackView: UIStackView, buttons: [UIButton]) {
        
        for button in buttons {
            stackView.addArrangedSubview(button)
        
        }
    }
    static func forMultipleAnswer(stackView: UIStackView, labelsAndSwitches: [UILabel: UISwitch]) {
        for (labels, switches) in labelsAndSwitches {
            
            stackView.addArrangedSubview(labels)
            stackView.addArrangedSubview(switches)
        }
        
    }
}

