//
//  ViewController.swift
//  millionaire
//
//  Created by Роман Чикишев on 29.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var SettingsButton: UIButton!
    
    @IBOutlet weak var StartButton: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "startGameSegue":
            guard segue.destination is GameController else {
                return
            }
        case "gameSettingsSegue":
            guard segue.destination is GameSetting else {
                return
            }
        default:
            break
        }
    }

}

