//
//  ResultViewController.swift
//  Quizzler
//
//  Created by Vsevolod Lashin on 14.04.2023.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var rightQuestionsLabel: UILabel!
    
    var rightQuestionsCount: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rightQuestionsLabel.text = "You have \(rightQuestionsCount.formatted())/\(Question.getQuestions().count) right answers! 😊"
    }
}
