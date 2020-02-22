import UIKit

protocol Moveable {
    var speed: Int { get set }
    func move()
}

class Human: Moveable {
    var speed: Int
    
    func move() {
        
    }
    
    init(speed: Int) {
        self.speed = speed
    }
}

class Dog: Moveable, Equatable {
    
    var speed: Int
    
    func move() {
        
    }
    
    init(speed: Int) {
        self.speed = speed
    }
    
    static func == (lhs: Dog, rhs: Dog) -> Bool {
        return lhs.speed == rhs.speed
    }
}

func slide(slider: Moveable) {
    slider.move()
}

let human = Human(speed: 10)
let dog = Dog(speed: 5)
slide(slider: human)
slide(slider: dog)

var moveables: [Moveable] = [Human(speed: 10), Dog(speed: 5)]

for index in 0..<moveables.count {
    moveables[index].move()
}

let a = Dog(speed: 10)
let b = Dog(speed: 5)

if a == b {
    print("==")
} else {
    print("!=")
}

// Protocol
// var { get set }
// required init
// Hashable
// Equatable
