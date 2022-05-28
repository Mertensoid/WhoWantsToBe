//
//  GameSession.swift
//  WhoWantsToBe
//
//  Created by admin on 27.05.2022.
//

import Foundation

class GameSession: GameDelegate {
    
    func refreshGameInfo(isRightAnswer: Bool) {
        if isRightAnswer {
            self.questions += 1
            self.rightAnswers.value += 1
        }
    }
    
    var questions: Int = 1
    var rightAnswers: Observable<Int>
    
    init() {
        self.rightAnswers = Observable(0)
    }
}

