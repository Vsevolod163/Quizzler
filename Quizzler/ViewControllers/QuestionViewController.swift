//
//  ViewController.swift
//  Quizzler
//
//  Created by Vsevolod Lashin on 14.04.2023.
//

import UIKit

protocol ResultViewControllerDelegate: AnyObject {
    func restart(
        withIndex index: Int,
        count: Int,
        progress: Float,
        shuffleQuestions: [Question],
        andQuestion question: String
    )
}

final class QuestionViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var questionProgressBar: UIProgressView!
    
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    
    // MARK: - Private properties
    private var questions = Question.getQuestions()
    private var questionIndex = 0
    private var isButtonTapped = true
    private var rigthQuestionsCount = 0
    
    // MARK: - View life circle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        questions.shuffle()
        questionLabel.text = questions[questionIndex].title
        
        trueButton.layer.cornerRadius = 20
        falseButton.layer.cornerRadius = 20
        
        trueButton.layer.borderWidth = 2.0
        falseButton.layer.borderWidth = 2.0
        
        trueButton.layer.borderColor = UIColor.white.cgColor
        falseButton.layer.borderColor = UIColor.white.cgColor
    }
    
    // MARK: - Prepare fo segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultViewController else { return }
        
        resultVC.rightQuestionsCount = rigthQuestionsCount
        resultVC.questions = questions
        resultVC.delegate = self
    }
    
    // MARK: - IB Actions
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard isButtonTapped else { return }
        isButtonTapped = false
        
        if sender.currentTitle != questions[questionIndex].checkable.rawValue {
            sender.backgroundColor = .red
        } else {
            sender.backgroundColor = .green
            rigthQuestionsCount += 1
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { timer in
            sender.backgroundColor = UIColor.clear
            self.nextQuestion()
            self.isButtonTapped = true
            let progress = Float(self.questionIndex) / Float(self.questions.count)
            self.questionProgressBar.setProgress(progress, animated: true)
        }
    }
    
    // MARK: - Private funcs
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex >= questions.count {
            performSegue(withIdentifier: "showResult", sender: nil)
            
            return
        }
        
        questionLabel.text = questions[questionIndex].title
    }
}

// MARK: - ResultViewContollerDelegate
extension QuestionViewController: ResultViewControllerDelegate {
    func restart(withIndex index: Int, count: Int, progress:Float, shuffleQuestions: [Question], andQuestion question: String) {
        questionIndex = index
        rigthQuestionsCount = count
        questionProgressBar.setProgress(progress, animated: true)
        questions = shuffleQuestions
        questionLabel.text = question
    }
}
