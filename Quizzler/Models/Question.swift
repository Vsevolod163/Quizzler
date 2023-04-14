//
//  Question.swift
//  Quizzler
//
//  Created by Vsevolod Lashin on 14.04.2023.
//

struct Question {
    let title: String
    let checkable: Checkable
    
    static func getQuestions() -> [Question] {
        [
            Question(
                title: "The blue whale is the biggest animal to have ever lived",
                checkable: .right
            ),
            Question(
                title: "An octopus has seven hearts",
                checkable: .wrong
            ),
            Question(
                title: "South Africa has one capital",
                checkable: .wrong
            ),
            Question(
                title: "Greenland is the smallest island in the world",
                checkable: .wrong
            ),
            Question(
                title: "The human eye can distinguish 10 million different colors",
                checkable: .right
            ),
            Question(
                title: "Dumbo is the longest Disney film",
                checkable: .wrong
            ),
            Question(
                title: "Pepperoni is the most popular pizza topping in the US",
                checkable: .right
            ),
            Question(
                title: "Hawaiian pizza comes from Hawai",
                checkable: .wrong
            ),
            Question(
                title: "The Harry Potter film, Chamber of Secrets, is the longest film of the Harry Potter movies",
                checkable: .right
            ),
        ]
    }
}

enum Checkable: String {
    case right = "True"
    case wrong = "False"
}
