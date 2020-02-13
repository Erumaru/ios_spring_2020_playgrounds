import UIKit

// STRONG REFERENCE CYCLE

class Human: Owner {
    let name: String
    let someFood = [Food(name: "Мясо"), Food(name: "Рыба")]
    func giveFood() -> [Food] {
        return someFood
    }
    
    init(name: String) {
        self.name = name
    }
}

class Food {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

protocol Owner {
    var name: String { get }
    func giveFood() -> [Food]
}

class Dog {
    let name: String
    var owner: Owner?
    
    func eat() {
//        let ok = true
//
//        guard ok else {
//            print("!ok")
//            return
//        }
//
//
//
//        print("ok")
//
//        if ok {
//            print("ok")
//        } else {
//            print("!ok")
//        }
        
        guard let owner = owner else {
            print("\(name), у тебя нет хозяина(")
            
            return
        }
        
        let food = owner.giveFood()
        
        print("\(name), у тебя есть хозяин \(owner.name), он дал тебе:")
        food.forEach {
            print($0.name)
        }
    }
    
    init(name: String) {
        self.name = name
    }
}

let dog = Dog(name: "Шарик")
let human = Human(name: "Абзал")

// Собака с хозяином
dog.owner = human
dog.eat()

// Собака без хозяина(
dog.owner = nil
dog.eat()
