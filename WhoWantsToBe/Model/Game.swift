//
//  Game.swift
//  WhoWantsToBe
//
//  Created by admin on 27.05.2022.
//

import Foundation

struct Result: Codable {
    let score: Double
    let date: String
}

class Game {
    static let shared = Game()
    
    private let resultsCaretaker = ResultsCaretaker()
    
    var session: GameSession?
    var results: [Result] = [] {
        didSet {
            resultsCaretaker.save(results: results)
        }
    }
    
    private init() {
        results = resultsCaretaker.load()
    }
    
    func getResult() {
        if let currentSession = session {
            var result = Double(currentSession.rightAnswers) / Double(currentSession.questions)
            result = result * 100
            let intResult = Double(Int(result)) / 100
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"
            results.append(contentsOf: [Result(score: intResult, date: formatter.string(from: Date()))])
        }
    }
}
