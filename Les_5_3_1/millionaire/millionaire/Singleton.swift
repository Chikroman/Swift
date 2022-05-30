//
//  Singleton.swift
//  millionaire
//
//  Created by Роман Чикишев on 30.05.2022.
//

import UIKit

class SingletonQuestions: NSObject {
    static let share = SingletonQuestions()
    private override init() {
        super.init()
    }
    var QuestionsArray: [Questions] = []
    var numberQuestion: Int = 1

}
