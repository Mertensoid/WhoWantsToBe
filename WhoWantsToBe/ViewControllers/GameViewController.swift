//
//  GameViewController.swift
//  WhoWantsToBe
//
//  Created by admin on 27.05.2022.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstAnswerButton: UIButton!
    @IBOutlet weak var secondAnswerButton: UIButton!
    @IBOutlet weak var thirdAnswerButton: UIButton!
    @IBOutlet weak var fourthAnswerButton: UIButton!
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        if let someString = sender.titleLabel?.text {
            if someString == questions[Game.shared.session!.questions-1].rightAnswer {
                
                self.gameDelegate?.refreshGameInfo(isRightAnswer: true)
                
                if Game.shared.session!.questions == questions.count+1 {
                    Game.shared.session!.questions -= 1
                    Game.shared.getResult()
                    Game.shared.session = nil
                    self.performSegue(withIdentifier: "unwindToMain", sender: self)
                    print(Game.shared.results)
                } else {
                    chooseQuestion()
                }
            } else {
                self.gameDelegate?.refreshGameInfo(isRightAnswer: false)
                Game.shared.getResult()
                Game.shared.session = nil
                self.performSegue(withIdentifier: "unwindToMain", sender: self)
                print(Game.shared.results)
            }
        }
    }

    weak var gameDelegate: GameDelegate?
    
    let questions: [Question] = {
        var gameDifficultyStrategy: GameDifficultyStrategy {
            switch Game.shared.difficulty {
            case .easy:
                return ConsistentQuestions()
            case .hard:
                return RandomQuestions()
            }
        }
        return gameDifficultyStrategy.returnQuestions()
    }()
        
    let observer = Observer()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gameDelegate = Game.shared.session
        chooseQuestion()
        
        Game.shared.session?.rightAnswers.addObserver(observer, options: [.initial, .new], closure: { answers, change in
            var result: Double = 0
            if answers == 0 {
                result = 0
            } else {
                result = Double(answers) / Double(self.questions.count)
                result = result * 100
            }
            
            let intResult = Int(result)
            self.scoreLabel.text = "Вопрос \(Game.shared.session!.questions). Правильных ответов \(intResult)%"
        })
    }

    private func chooseQuestion() {
        questionLabel.text = questions[Game.shared.session!.questions-1].question
        firstAnswerButton.setTitle(questions[Game.shared.session!.questions-1].answers[0], for: .normal)
        secondAnswerButton.setTitle(questions[Game.shared.session!.questions-1].answers[1], for: .normal)
        thirdAnswerButton.setTitle(questions[Game.shared.session!.questions-1].answers[2], for: .normal)
        fourthAnswerButton.setTitle(questions[Game.shared.session!.questions-1].answers[3], for: .normal)
    }
}

class Observer { }

protocol GameDelegate: AnyObject {
    func refreshGameInfo(isRightAnswer: Bool)
}
