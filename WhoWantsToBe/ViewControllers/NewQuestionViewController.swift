//
//  NewQuestionViewController.swift
//  WhoWantsToBe
//
//  Created by admin on 28.05.2022.
//

import UIKit

class NewQuestionViewController: UIViewController {

    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var firstAnswerTextLabel: UITextField!
    @IBOutlet weak var secondAnswerTextLabel: UITextField!
    @IBOutlet weak var thirdAnswerTextLabel: UITextField!
    @IBOutlet weak var fourthAnswerTextLabel: UITextField!
    @IBOutlet weak var rightAnswerControl: UISegmentedControl!
    @IBAction func saveButtonPressed(_ sender: Any) {
        addQuestion()
        performSegue(withIdentifier: "unwindToMain", sender: self)
    }
    
    let questionsCaretaker = QuestionsCaretaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func addQuestion() {
        guard
            let question = questionTextField.text,
            let firstAnswer = firstAnswerTextLabel.text,
            let secondAnswer = secondAnswerTextLabel.text,
            let thirdAnswer = thirdAnswerTextLabel.text,
            let fourthAnswer = fourthAnswerTextLabel.text
        else { return }
        var rightAnswer = ""
        switch rightAnswerControl.selectedSegmentIndex {
        case 0:
            rightAnswer = "A: \(firstAnswer)"
        case 1:
            rightAnswer = "B: \(secondAnswer)"
        case 2:
            rightAnswer = "C: \(thirdAnswer)"
        case 3:
            rightAnswer = "D: \(fourthAnswer)"
        default:
            rightAnswer = "A: \(firstAnswer)"
        }
        let newQuestion = Question(
            question: question,
            answers: [
                "A: \(firstAnswer)",
                "B: \(secondAnswer)",
                "C: \(thirdAnswer)",
                "D: \(fourthAnswer)"
            ],
            rightAnswer: rightAnswer
        )
        questions.append(newQuestion)
        print(questions)
        questionsCaretaker.save(questions: questions)
    }
}
