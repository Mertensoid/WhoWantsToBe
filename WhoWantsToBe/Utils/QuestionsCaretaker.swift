//
//  QuestionsCaretaker.swift
//  WhoWantsToBe
//
//  Created by admin on 28.05.2022.
//

import Foundation

class QuestionsCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "questions"
    
    func save(questions: [Question]) {
        do {
            let data = try encoder.encode(questions)
            UserDefaults.standard.set(data, forKey: "questions")
        } catch {
            print(error)
        }
    }
    
    func load() -> [Question] {
        guard let data = UserDefaults.standard.value(forKey: "questions") else { return [] }
        do {
            return try decoder.decode([Question].self, from: data as! Data)
        } catch {
            print(error)
            return []
        }
    }
}
