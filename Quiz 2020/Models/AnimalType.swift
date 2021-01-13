//
//  AnimalType.swift
//  Quiz 2020
//
//  Created by Алексей Пасынков on 22.11.2020.
//

enum AnimalType: String {
    case bmw = "BMW 🚀"
    case tesla = "Tesla 🚎"
    case mercedes = "MB 🛥"
    case lada = "Lada 💩"
    
    var definition: String {
        switch self {
        case .bmw:
            return "Валим боком по-царски, но до первого сервиса"
        case .tesla:
            return "Я плачу за бенз, а Илон лучше чем Безз"
        case .mercedes:
            return "Я король дорог, правда денег много ушло, а скрип остался"
        case .lada:
            return "Говно в говне не тонит. Зато зимой все валят боком на мне"
        }
    }
}
