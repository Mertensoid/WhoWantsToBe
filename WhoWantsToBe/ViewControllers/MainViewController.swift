//
//  MainViewController.swift
//  WhoWantsToBe
//
//  Created by admin on 27.05.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBAction func unwindAction(unwindSegue: UIStoryboardSegue){
        
    }
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "startGame" else { return }
        Game.shared.session = GameSession()
        
    }

}
