//
//  Question.swift
//  CarQiz
//
//  Created by Алексей Пасынков on 12.01.2021.
//

struct Question {
    let text: String
    let type: ResponseType
    let answers: [Answer]
    
    static let allQuestion: [Question] = [
        Question(text: "Любите ли вы ездить боков на своей машине?", type: .single , answers: [
            Answer(text: "ДААА! На стоке валим боком", type: .bmw),
            Answer(text: "Да, но только зимой", type: .lada),
            Answer(text: "Очень редко. Это не мое", type: .mercedes),
            Answer(text: "Ха. Боком? Смешно.", type: .tesla),
        ]),
        Question(text: "Как часто вы будете заезжаеть на заправку?", type: .range, answers: [
            Answer(text: "Никогда", type: .tesla),
            Answer(text: "Редко", type: .lada),
            Answer(text: "Давольно часто", type: .mercedes),
            Answer(text: "Буду там жить", type: .bmw),
        ]),
        Question(text: "С какими утверждениями вы согласны?", type: .multiple, answers: [
            Answer(text: "BMW лучшая марка", type: .bmw),
            Answer(text: "Нет, MB лучшая марка", type: .mercedes),
            Answer(text: "Илон Маск - гений", type: .tesla),
            Answer(text: "Главное на колесах", type: .lada)
        ]),
    ]
}
