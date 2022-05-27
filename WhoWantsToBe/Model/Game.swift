//
//  Game.swift
//  WhoWantsToBe
//
//  Created by admin on 27.05.2022.
//

import Foundation

class Game {
    static let shared = Game()
    
    var session: GameSession?
    var results: [Double] = []
    
    private init() {
        
    }
    
    func getResult() {
        if let currentSession = session {
            var result = Double(currentSession.rightAnswers) / Double(currentSession.questions+1)
            result = result * 100
            let intResult = Double(Int(result)) / 100
            results.append(contentsOf: [intResult])
        }
    }
}
