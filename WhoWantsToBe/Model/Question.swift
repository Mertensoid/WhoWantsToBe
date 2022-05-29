//
//  Question.swift
//  WhoWantsToBe
//
//  Created by admin on 27.05.2022.
//

import Foundation

struct Question: Codable {
    let question: String
    let answers: [String]
    let rightAnswer: String
}


