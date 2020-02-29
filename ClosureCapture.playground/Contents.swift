import UIKit

class Person {
    var mood: Int = 0
    var dog: Dog
    
    init(_ dog: Dog) {
        self.dog = dog
        var a = 10
        self.dog.doSomething = { [weak self] in
            a += 10
            self?.mood += 10
        }
    }
}

class Dog {
    var doSomething: (() -> Void)?
}

let dog = Dog()
let person = Person(dog)
dog.doSomething?()
print(person.mood)

// Person -> Dog -> doSomething -> weak Person
