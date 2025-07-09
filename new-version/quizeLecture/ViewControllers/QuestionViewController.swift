//
//  ViewController.swift
//  quizeLecture
//
//  Created by David Puksanskis on 11.5.2025.
//

import UIKit


final class QuestionViewController: UIViewController {

    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var singleStackView: UIStackView!
    let buttonsSingle = AnswerMethods.createButtonsSingle()
    
        
    @IBOutlet weak var multipleStackView: UIStackView!
    let multipleAnswers = AnswerMethods.createMultipleAnswers()
    let multipleButton = AnswerMethods.createMultipleAcceptButton()
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet weak var rangedSlider: UISlider!
    let currentSliderValueLabel = UILabel()
    
    
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
        
        
        
        
        viewFrames()
        MoveInStackView.forSingleAnswer(stackView: singleStackView, buttons: buttonsSingle)
        singleButtonTarget()
        switchTargetsChoosen()
        multipleStackView.addArrangedSubview(multipleButton)
        
    
        rangedStackView.insertArrangedSubview(currentSliderValueLabel, at: 0)
        
        
        

        
        updateUI()
    }
    
    func viewFrames() {
        
        singleStackView.translatesAutoresizingMaskIntoConstraints = false
        multipleStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            singleStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            singleStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            singleStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            singleStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
        
        for (answer, switches) in multipleAnswers {
            let stackView = UIStackView(arrangedSubviews: [answer, switches], axis: .horizontal, spacing: 10)
            multipleStackView.addArrangedSubview(stackView)
        }
        
        
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
               print(answer)
        
               nextQuestion()
        
    }
    private func switchTargetsChoosen() {
    
        multipleButton.addTarget(self, action: #selector(multipleButtonPressed(_:)), for: .touchUpInside)
    }
    
    @objc func multipleButtonPressed(_ sender: UIButton) {
        
        for ((text ,multipleSwitch)) in multipleAnswers {
            if multipleSwitch.isOn {
                if let match = currentAnswers.first(where: { $0.title == text.text }) {
                    answerChosen.append(match)
                    print(match)
                }
                    
            }
        }
        nextQuestion()
    }
    @IBAction func sliderMoved(_ sender: Any) {
        
        let index = Int(rangedSlider.value)
        currentSliderValueLabel.text = currentAnswers[index].title
        
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        
        let index = lrintf(rangedSlider.value)
        answerChosen.append(currentAnswers[index])
        print(index)
        
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


