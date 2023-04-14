//
//  ViewController.swift
//  Quizzler
//
//  Created by Vsevolod Lashin on 14.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    
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

    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        nextQuestion()
        questionLabel.text = questions[questionIndex].title
        
    }
    
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex == questions.count {
            questionIndex = 0
        }
    }
}

