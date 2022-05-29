//
//  ResultsCaretaker.swift
//  WhoWantsToBe
//
//  Created by admin on 28.05.2022.
//

import Foundation

class ResultsCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "results"
    
    func save(results: [Result]) {
        do {
            let data = try encoder.encode(results)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func load() -> [Result] {
        guard let data = UserDefaults.standard.value(forKey: key) else {
            return []
        }
        do {
            return try decoder.decode([Result].self, from: data as! Data)
        } catch {
            print(error)
            return []
        }
    }
}

