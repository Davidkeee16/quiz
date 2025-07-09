//
//  buttonsSingle.swift
//  quizeLecture
//
//  Created by David Puksanskis on 18/06/2025.
//

import Foundation
import UIKit




struct AnswerMethods {
    

    static func createButtonsSingle() -> [UIButton] {
        
        var buttons: [UIButton] = []
        
        for question in Question.getQuestions() {
            if question.responseType == .single {
                for text in question.answers {
                    
                    buttons.append(UIButton(title: text.title))
                }
            }
        }
        
        
        return buttons
    }

    static func createMultipleAnswers() -> ([UILabel: UISwitch]) {
        
        var switches: [UISwitch] = []
        var labels: [UILabel] = []
        
        
        for question in Question.getQuestions() {
            if question.responseType == .multiple {
                for text in question.answers {
                    labels.append(UILabel(text: text.title))
                    switches.append(UISwitch())
                }
            }
        }
        
        let dict = Dictionary(uniqueKeysWithValues: zip(labels, switches))
        return dict
    }
    static func createMultipleAcceptButton() -> UIButton {
        return UIButton(title: "Accept")
    }
    
    
}



