//
//  ViewController.swift
//  quizeLecture
//
//  Created by David Puksanskis on 11.5.2025.
//

import UIKit
import Foundation

final class QuestionViewController: UIViewController {

    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var singleStackView: UIStackView!
    let buttonsSingle = ButtonsSingle.createButton()
    
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet weak var rangedSlider: UISlider!
    
    private let questions = Question.getQuestions()
    private var answerChosen: [Answer] = []
    private var questionIndex = 0
    
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let count = Float(currentAnswers.count - 1)
        rangedSlider.maximumValue = count
        rangedSlider.value = count / 2
        
        
        
        MoveInStackView.inside(stackView: singleStackView, buttons: buttonsSingle)
        singleButtonTarget()

        
        updateUI()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let resultVC = segue.destination as? ResultViewController else { return }
        resultVC.answers = answerChosen
    }
    
    private func singleButtonTarget() {
        for button in buttonsSingle {
            button.addTarget(self, action: #selector(singleButtonPressed(_:)), for: .touchUpInside)
        }
    }
    
    @objc func singleButtonPressed(_ sender: UIButton) {
        
        
        guard let buttonIndex = buttonsSingle.firstIndex(of: sender) else { return }
               let answer = currentAnswers[buttonIndex]
               answerChosen.append(answer)
        
        
               nextQuestion()
    }
    
    @IBAction func multipleButtonPressed() {
        
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answerChosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        
        let index = lrintf(rangedSlider.value)
        answerChosen.append(currentAnswers[index])
        nextQuestion()
    }
    
    
    private func updateUI() {
        
        
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        
        let currentQuestion = questions[questionIndex]
        
        questionLabel.text = currentQuestion.title
        
        
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        
        questionProgressView.setProgress(totalProgress, animated: true)
        
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        showCurrentAnswers(for: currentQuestion.responseType)
    }
    
    private func showCurrentAnswers(for type: ResponseType) {
        switch type {
        case .single: showSingleStackView(with: currentAnswers)
        case .multiple: showMultipleStackView(with: currentAnswers)
        case .ranged: showRangedStackView(with: currentAnswers)
        }
        
    }
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden = false
    }
    
    private func showMultipleStackView(with answers: [Answer]) {
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.title
        }
    }
    private func showRangedStackView(with answers: [Answer]) {
        rangedStackView.isHidden = false
        
        rangedLabels.first?.text = answers.first?.title
        rangedLabels.last?.text = answers.last?.title
    }
    
    
    private func nextQuestion() {
        
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
            
            return
            
        }
        
        performSegue(withIdentifier: "showResult", sender: nil)
    
    }
}


