//
//  ResultViewController.swift
//  Quizzler
//
//  Created by Vsevolod Lashin on 14.04.2023.
//

import UIKit

final class ResultViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var rightQuestionsLabel: UILabel!
    @IBOutlet var restartButton: UIButton!
    
    // MARK: - Properties
    var rightQuestionsCount: Int!
    var questions: [Question]!
    unowned var delegate: ResultViewControllerDelegate!
    
    // MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restartButton.layer.cornerRadius = 20
        restartButton.layer.borderWidth = 2.0
        restartButton.layer.borderColor = UIColor.white.cgColor
        
        rightQuestionsLabel.text = "You have \(rightQuestionsCount.formatted())/\(questions.count) right answers! 😊"
    }
    
    // MARK: - IB Actions
    @IBAction func restartButtonPressed() {
        questions.shuffle()
        
        delegate.restart(
            withIndex: 0,
            count: 0,
            shuffleQuestions: questions,
            andQuestion: questions[0].title
        )
        dismiss(animated: true)
    }
}
