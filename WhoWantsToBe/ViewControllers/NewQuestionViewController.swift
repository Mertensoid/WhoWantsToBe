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
    @IBAction func saveButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "unwindToMain", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
