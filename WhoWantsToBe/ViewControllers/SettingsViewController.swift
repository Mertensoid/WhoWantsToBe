//
//  SettingsViewController.swift
//  WhoWantsToBe
//
//  Created by admin on 28.05.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var difficultyControl: UISegmentedControl!
    @IBAction func okButtonPressed(_ sender: Any) {
        switch difficultyControl.selectedSegmentIndex {
        case 0:
            Game.shared.difficulty = .easy
        case 1:
            Game.shared.difficulty = .hard
        default:
            Game.shared.difficulty = .easy
        }
        
        self.performSegue(withIdentifier: "unwindToMain", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch Game.shared.difficulty {
        case .easy:
            difficultyControl.selectedSegmentIndex = 0
        case .hard:
            difficultyControl.selectedSegmentIndex = 1
        }
    }
}
