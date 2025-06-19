//
//  buttonsSingle.swift
//  quizeLecture
//
//  Created by David Puksanskis on 18/06/2025.
//

import Foundation
import UIKit




struct ButtonsSingle {
    

    static func createButton() -> [UIButton] {
        
        var buttons: [UIButton] = []
        
        for question in Question.getQuestions() {
            if question.responseType == .single {
                for text in question.answers {
                    let button = UIButton(title: text.title)
                    buttons.append(button)
                }
            }
        }
        
        
        return buttons
    }

        
    
    
}
