//
//  GameSetting.swift
//  millionaire
//
//  Created by Роман Чикишев on 05.06.2022.
//

import UIKit

class GameSetting: UIViewController {

    @IBOutlet weak var difficultyControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var selectedSettings: Strategy {
        switch difficultyControl.selectedSegmentIndex {
        case 0:
            SingletonQuestions.share.Settings = .successively
            return .successively
        case 1:
            SingletonQuestions.share.Settings = .successively
            return .randomly
            
        default:
            SingletonQuestions.share.Settings = .successively
            return .successively
        }
    }


}
