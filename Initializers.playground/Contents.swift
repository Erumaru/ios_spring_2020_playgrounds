import UIKit

struct Dog {
    var name: String
    var age: Int = 0
}

class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Student: Person {
    var gpa: Double
    
    init(name: String, gpa: Double) {
        self.gpa = gpa
        super.init(name: name)
    }
    
    required init(dog: Dog) {
        self.gpa = 0
        super.init(name: dog.name)
    }
}


class View: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("dont use storyboard")
    }
}
