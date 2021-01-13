//
//  ResultsViewController.swift
//  Quiz 2020
//
//  Created by Алексей Пасынков on 22.11.2020.
//

import UIKit


class ResultsViewController: UIViewController {
    
    @IBOutlet weak var animalsLable: UILabel!
    @IBOutlet weak var defenitionLable: UILabel!
    
    let answers: [Answer]
    
    init?(coder: NSCoder, _ answers: [Answer]) {
        self.answers = answers
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("\(#line) \(#function) init(coder:) has not been implemented")
    }
    
    func calculatePersonalityResult() {
        print(answers )
        let frequencyOfAnswers = answers.reduce(into: [:]) { counts, answer in
            counts[answer.type, default: 0] += 1
        }
        print(frequencyOfAnswers)
        let frequencyOfAnswerSorted = frequencyOfAnswers.sorted { $0.value > $1.value }
        print(frequencyOfAnswerSorted)
        let mostCommonAnswer = frequencyOfAnswerSorted.first!.key
        print(mostCommonAnswer)
        updateUI(with: mostCommonAnswer)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()
    }
    
    func updateUI(with animal: AnimalType) {
        animalsLable.text = "Вам подходит \(animal.rawValue)"
        defenitionLable.text = "\(animal.definition)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
