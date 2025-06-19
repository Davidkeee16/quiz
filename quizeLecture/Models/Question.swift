//
//  File.swift
//  quizeLecture
//
//  Created by David Puksanskis on 11.5.2025.
//

import Foundation



struct Question {
    
    let title: String
    let responseType: ResponseType
    let answers: [Answer]
    
    
    
    static func getQuestions() -> [Question] {
        
        return [
            Question(
                title: "Какую пищу вы предпочитаете?",
                responseType: .single,
                answers: [
                    Answer(title: "Стейк", animal: .dog),
                    Answer(title: "Рыба", animal: .cat),
                    Answer(title: "Морковь", animal: .rabbit),
                    Answer(title: "Кукуруза", animal: .turtle),
                    Answer(title: "Отбросы", animal: .racoon)
                ]
             ),
            Question(
                title: "Что вам нравится больше?",
                responseType: .multiple,
                answers: [
                    Answer(title: "Плавать", animal: .dog),
                    Answer(title: "Спать", animal: .cat),
                    Answer(title: "Обниматься", animal: .rabbit),
                    Answer(title: "Есть", animal: .turtle)
                ]
             ),
            Question(
                title: "Любите ли вы поездки на машине?",
                responseType: .ranged,
                answers: [
                    Answer(title: "Ненавижу", animal: .cat),
                    Answer(title: "Нервничаю", animal: .rabbit),
                    Answer(title: "Не замечаю", animal: .turtle),
                    Answer(title: "Обожаю", animal: .dog)
                ]
            )
        ]
    }
}


enum ResponseType {
    case single
    case multiple
    case ranged
}

struct Answer {
    
    let title: String
    let animal: Animal
}

enum Animal: Character {
    
    case dog = "🐶"
    case cat = "🐱"
    case turtle = "🐢"
    case rabbit = "🐰"
    case racoon = "🦝"
    
    
    var definition: String {
        
        switch self {
        case .dog:
            return "Вам нравится быть с друзьями. Вы окружаете себя людьми, которые вам нравятся и все готовы помочь"
        case .cat:
            return "Вы себе на уме. Любите гулять свми по себе. Вы цените одиночество."
        case .turtle:
            return "Ваша сила - в мудрости. Медленный и вдумчивый выигрывает на больших дистанциях."
        case .rabbit:
            return "Вам нравится все мягкое. Вы здоровы и полны энергии."
        case .racoon:
            return "Вы раздолбай"
        }
    }
}


