//
//  QuestionViewController.swift
//  Quiz 2020
//
//  Created by Алексей Пасынков on 21.11.2020.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLable: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var multipleLables: [UILabel]!
    @IBOutlet var multiSwitches: [UISwitch]!
    
    @IBOutlet weak var rangeStackView: UIStackView!
    @IBOutlet var rangeLables: [UILabel]!
    @IBOutlet var rangedSlider: UISlider!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    private var answersChosen = [Answer]() {
        didSet {
            print(#line, #function, answersChosen)
        }
    }
    private var currentAnswers: [Answer] {
        currentQuestion.answers
    }
    private var currentQuestion: Question {
        Question.allQuestions[questionIndex]
    }

    var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rangedSlider.maximumValue = 0.99999
        updateUI()
    }
    
    func updateUI() {
        
        func updateSingleStackView() {
            singleStackView.isHidden = false
            for (index, button) in singleButtons.enumerated() {
                button.setTitle(nil, for: [])
                button.tag = index
            }
            for (button, answer) in zip(singleButtons, currentAnswers) {
                button.setTitle(answer.text, for: [])
            }
        }
        
        func updateMultipleStackView() {
            multipleStackView.isHidden = false
            for label in multipleLables {
                label.text = nil
            }
            for (lable, answer) in zip(multipleLables, currentAnswers) {
                lable.text = answer.text
            }
        }
        
        func updateRangeStackView() {
            rangeLables.first?.text = currentAnswers.first?.text
            rangeLables.last?.text = currentAnswers.last?.text
            rangeStackView.isHidden = false
        }
        
        for stackView in [singleStackView, multipleStackView, rangeStackView] {
            stackView?.isHidden = true
        }
        
        let totalProgress = Float(questionIndex) / Float(Question.allQuestions.count)
        
        navigationItem.title = "Вопрос № \(questionIndex + 1)"
        questionLable.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStackView()
        case .multiple:
            updateMultipleStackView()
        case .range:
            updateRangeStackView()
        }
    }
    
    func nextQuestin() {
        questionIndex += 1
        if questionIndex < Question.allQuestions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "Results Controller", sender: nil)
        }
    }

    @IBAction func singleButtonPressed(_ sender: UIButton) {
        let answers = Question.allQuestions[questionIndex].answers
        let index = sender.tag
        guard 0 <= index && index < answers.count else {
            return
        }
        let answer = answers[index]
        answersChosen.append(answer)
        nextQuestin()
    }
    
    @IBAction func multiButtonPressed() {
        for (index, multiSwitch) in multiSwitches.enumerated() {
            if multiSwitch.isOn && index < currentAnswers.count {
                let answer = currentAnswers[index]
                answersChosen.append(answer)
            }
        }
        nextQuestin()
    }
    
    @IBAction func rangeButtonPressed() {
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        if index < currentAnswers.count {
            let answer = currentAnswers[index]
            answersChosen.append(answer)
        }
        nextQuestin()
    }
    
    @IBSegueAction func resultsSegue(_ coder: NSCoder) -> ResultsViewController? {
        return ResultsViewController(coder: coder, answersChosen)
    }
    
}
