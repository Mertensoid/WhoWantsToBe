//
//  GameDifficultyStrategy.swift
//  WhoWantsToBe
//
//  Created by admin on 28.05.2022.
//

import Foundation


var questions: [Question] = {
    var questions: [Question] = []
    let questionCaretaker = QuestionsCaretaker()
    questions = questionCaretaker.load()
    if questions.isEmpty {
        questions = [
            Question(
                question: "Что растёт в огороде?",
                answers: ["A: Лук","B: Пистолет","C: Пулемёт","D: Ракета СС-20"],
                rightAnswer: "A: Лук"
            ),
            Question(
                question: "Как называют микроавтобусы, совершающие поездки по определённым маршрутам?",
                answers: ["A: Рейсовка","B: Путёвка","C: Курсовка","D: Маршрутка"],
                rightAnswer: "D: Маршрутка"
            ),
            Question(
                question: "О чём писал Грибоедов, отмечая, что он «нам сладок и приятен»?",
                answers: ["A: Дым Отечества","B: Дух купечества","C: Дар пророчества","D: Пыл девичества"],
                rightAnswer: "A: Дым Отечества"
            ),
            Question(
                question: "Какого персонажа нет в известной считалке «На золотом крыльце сидели»?",
                answers: ["A: Сапожника","B: Кузнеца","C: Короля","D: Портного"],
                rightAnswer: "B: Кузнеца"
            ),
            Question(
                question: "Какой специалист занимается изучением неопознанных летающих объектов?",
                answers: ["A: Кинолог","B: Уфолог","C: Сексопатолог","D: Психиатр"],
                rightAnswer: "B: Уфолог"
            ),
            Question(
                question: "Как называется разновидность воды, в которой атом водорода замещён его изотопом дейтерием?",
                answers: ["A: Лёгкая","B: Средняя","C: Тяжёлая","D: Невесомая"],
                rightAnswer: "C: Тяжёлая"
            ),
            Question(
                question: "Что такое десница?",
                answers: ["A: Бровь","B: Глаз","C: Шея","D: Рука"],
                rightAnswer: "D: Рука"
            ),
            Question(
                question: "В какое море впадает река Урал?",
                answers: ["A: Азовское","B: Чёрное","C: Средиземное","D: Каспийское"],
                rightAnswer: "D: Каспийское"
            ),
            Question(
                question: "На что кладут руку члены английского общества лысых во время присяги?",
                answers: ["A: Баскетбольный мяч","B: Бильярдный шар","C: Апельсин","D: Кокосовый орех"],
                rightAnswer: "B: Бильярдный шар"
            ),
            Question(
                question: "Как назывался каменный монолит, на котором установлен памятник Петру I в Санкт-Петербурге?",
                answers: ["A: Дом-камень","B: Гром-камень","C: Гора-камень","D: Разрыв-камень"],
                rightAnswer: "B: Гром-камень"
            ),
            Question(
                question: "Как Пётр Ильич Чайковский назвал свою серенаду для скрипки с оркестром си-бемоль минор?",
                answers: ["A: Флегматическая","B: Меланхолическая","C: Холерическая","D: Сангвиническая"],
                rightAnswer: "B: Меланхолическая"
            ),
            Question(
                question: "Какого ордена не было у первого советского космонавта Юрия Гагарина?",
                answers: ["A: «Ожерелье Нила» (Египет)","B: «Крест Грюнвальда» (Польша)","C: «Плайя Хирон» (Куба)","D: «Орден двойного дракона» (Китай)"],
                rightAnswer: "D: «Орден двойного дракона» (Китай)"
            ),
            Question(
                question: "Какое животное имеет второе название — кугуар? ",
                answers: ["A: Оцелот","B: Леопард","C: Пума","D: Пантера"],
                rightAnswer: "C: Пума"
            ),
            Question(
                question: "Что в России 19 века делали в дортуаре?",
                answers: ["A: Ели","B: Спали","C: Ездили верхом","D: Купались"],
                rightAnswer: "B: Спали"
            ),
            Question(
                question: "Какой химический элемент назван в честь злого подземного гнома?",
                answers: ["A: Гафний","B: Кобальт","C: Бериллий","D: Теллур"],
                rightAnswer: "B: Кобальт"
            )
        ]
    }
    return questions
}()


protocol GameDifficultyStrategy {
    func returnQuestions() -> [Question]
}

class ConsistentQuestions: GameDifficultyStrategy {
    func returnQuestions() -> [Question] {
        let array = questions
        return array
    }
}

class RandomQuestions: GameDifficultyStrategy {
    func returnQuestions() -> [Question] {
        var questions = questions
        var array: [Question] = []
        let numberOfQuestions = questions.count
        for _ in 1...numberOfQuestions {
            let randomIndex = Int.random(in: 1...questions.count)
            array.append(questions[randomIndex-1])
            questions.remove(at: randomIndex-1)
        }
        print(array)
        return array
    }
}
