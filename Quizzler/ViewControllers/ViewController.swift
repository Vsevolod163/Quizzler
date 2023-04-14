//
//  ViewController.swift
//  Quizzler
//
//  Created by Vsevolod Lashin on 14.04.2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    
    // MARK: - Private properties
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var isButtonTapped = true
    
    // MARK: - View life circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = questions[questionIndex].title
        
        trueButton.layer.cornerRadius = 20
        falseButton.layer.cornerRadius = 20
        
        trueButton.layer.borderWidth = 1.0
        falseButton.layer.borderWidth = 1.0
        
        trueButton.layer.borderColor = UIColor.white.cgColor
        falseButton.layer.borderColor = UIColor.white.cgColor
    }

    // MARK: - IB Actions
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard isButtonTapped else { return }
        isButtonTapped = false
        
        if sender.currentTitle != questions[questionIndex].checkable.rawValue {
            sender.backgroundColor = .red
        } else {
            sender.backgroundColor = .green
        }
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
            sender.backgroundColor = UIColor.clear
            self.nextQuestion()
            self.questionLabel.text = self.questions[self.questionIndex].title
            self.isButtonTapped = true
        }
    }
    
    // MARK: - Private funcs
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex == questions.count {
            questionIndex = 0
        }
    }
}

