//
//  AnimalType.swift
//  Quiz 2020
//
//  Created by Алексей Пасынков on 22.11.2020.
//

enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "Вы верны своим друзьям и близким. Всегда готовы прийти на помощь."
        case .cat:
            return "Вы всегда сами по себе и любите проводить больше времени валяясь дома."
        case .rabbit:
            return "У вас моря энергии и вы готовы бежать куда угодно безоглядки."
        case .turtle:
            return "Вы очень медлительны и умны. Вы знаете, что если делать все с толком и расстановкой, не слома голову, можно добиться больших высот"
        }
    }
}
