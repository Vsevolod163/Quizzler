//
//  Question.swift
//  Quizzler
//
//  Created by Vsevolod Lashin on 14.04.2023.
//

import Foundation

struct Question {
    let title: String
    let checkable: Checkable
    
    static func getQuestions() -> [Question] {
        [
            Question(
                title: "Столица России - Москва",
                checkable: .right
            ),
            Question(
                title: "Арбуз - это фрукт",
                checkable: .wrong
            ),
            Question(
                title: "Дельфин - это млекопитающие",
                checkable: .right
            )
        ]
    }
}

enum Checkable: String {
    case right = "Right"
    case wrong = "True"
}
