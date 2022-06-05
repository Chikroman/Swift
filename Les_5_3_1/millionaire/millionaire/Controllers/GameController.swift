//
//  GameController.swift
//  millionaire
//
//  Created by Роман Чикишев on 29.05.2022.
//

import UIKit

class GameController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerAButton: UIButton!
    
    @IBOutlet weak var answerBButton: UIButton!
    
    @IBOutlet weak var answerCButton: UIButton!
    
    @IBOutlet weak var answerDButton: UIButton!
    
    @IBOutlet weak var answerALabel: UILabel!
    
    @IBOutlet weak var answerBLabel: UILabel!
    
    @IBOutlet weak var answerCLabel: UILabel!
    
    @IBOutlet weak var answerDLabel: UILabel!
    
    @IBOutlet weak var numberQuestinLabel: UILabel!
   
    @IBOutlet weak var percentCompleteLabel: UILabel!
    
    let observer = Observer()

    let numberQuestion = NumberQuestions(numberQuestion: SingletonQuestions.share.numberQuestion)



    
    override func viewDidLoad() {
        super.viewDidLoad()
        initQuestions()
        nextQuestions()
    }
    
    func initQuestions() {
        // MARK: не смог разобраться в ошибке приложение падает при начале игры
        numberQuestion.numberQuestion.addObserver(observer, options: [.initial, .new, .old]) { [weak self] numberQuestion, change  in
            self?.numberQuestinLabel.text = "Вопрос № "+String(numberQuestion)
            let count = SingletonQuestions.share.QuestionsArray.count
            self?.percentCompleteLabel.text = "Выполнено " + String(numberQuestion/count*100)
        }
        
        var question = Questions(textQuestions: "Что растёт в огороде?",
                                 answerA: "Лук",
                                 answerB: "Пистолет",
                                 answerС: "Пулемёт",
                                 answerD: "Ракета СС-20",
                                 correctAnswer: "Лук")
        SingletonQuestions.share.QuestionsArray.append(question)
        
        question = Questions(textQuestions: "Как называют микроавтобусы, совершающие поездки по определённым маршрутам?",
                             answerA: "Рейсовка",
                             answerB: "Путёвка",
                             answerС: "Курсовка",
                             answerD: "Маршрутка",
                             correctAnswer: "Маршрутка")
        SingletonQuestions.share.QuestionsArray.append(question)
        
        question = Questions(textQuestions: "О чём писал Грибоедов, отмечая, что он «нам сладок и приятен» ?",
                             answerA: "Дым Отечества",
                             answerB: "Дух купечества",
                             answerС: "Дар пророчества",
                             answerD: "Пыл девичества",
                             correctAnswer: "Дым Отечества")
        SingletonQuestions.share.QuestionsArray.append(question)

        question = Questions(textQuestions: "Какого персонажа нет в известной считалке «На золотом крыльце сидели» ?",
                             answerA: "Сапожника",
                             answerB: "Кузнеца",
                             answerС: "Короля",
                             answerD: "Портного",
                             correctAnswer: "Кузнеца")
        SingletonQuestions.share.QuestionsArray.append(question)
        
        question = Questions(textQuestions: "Какой специалист занимается изучением неопознанных летающих объектов?",
                             answerA: "Кинолог",
                             answerB: "Уфолог",
                             answerС: "Сексопатолог",
                             answerD: "Психиатр",
                             correctAnswer: "Уфолог")
        SingletonQuestions.share.QuestionsArray.append(question)
    }
    func nextQuestions() {
        var question = Questions()
        if SingletonQuestions.share.Settings == .successively {
            question = SingletonQuestions.share.QuestionsArray[SingletonQuestions.share.numberQuestion-1]

        }else {
            var numberQuestion = 0
            numberQuestion = Int.random(in: 1...SingletonQuestions.share.QuestionsArray.count)
            question = SingletonQuestions.share.QuestionsArray[numberQuestion-1]

        }
        questionLabel.text = question.textQuestions
        answerALabel.text = "A:" + question.answerA
        answerBLabel.text = "B:" + question.answerB
        answerCLabel.text = "C:" + question.answerС
        answerDLabel.text = "D:" + question.answerD
    }
    
}

class NumberQuestions {
    let numberQuestion: Observable<Int>
    
    public init(numberQuestion: Int) {
        self.numberQuestion = Observable(numberQuestion)
    }
}

class Observer {}



