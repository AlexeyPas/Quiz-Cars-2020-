//
//  Question.swift
//  Quiz 2020
//
//  Created by Алексей Пасынков on 22.11.2020.
//

struct Question {
    let text: String
    let type: ResponseType
    let answers: [Answer]
    
    static let allQuestions: [Question] = [
        Question(text: "Что вы больше всего любите есть:", type: .single, answers: [
            Answer(text: "Мясо", type: .dog),
            Answer(text: "Рыбу", type: .cat),
            Answer(text: "Морковку", type: .rabbit),
            Answer(text: "Капусту", type: .turtle),
        ]),
        Question(text: "Что вы любите делать:", type: .single, answers: [
            Answer(text: "Плавать", type: .turtle),
            Answer(text: "Бегать", type: .dog),
            Answer(text: "Скакать", type: .rabbit),
            Answer(text: "Спать", type: .cat),
        ]),
        Question(text: "Любите ли вы долгие поездки на машине?", type: .single, answers: [
            Answer(text: "Ненавижу", type: .cat),
            Answer(text: "Переживаю", type: .rabbit),
            Answer(text: "Все равно", type: .turtle),
            Answer(text: "Обожаю", type: .dog),
        ]),
    ]
}
