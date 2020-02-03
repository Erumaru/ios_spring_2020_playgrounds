import UIKit
import Foundation

struct User {
    var name: String = ""
    
    mutating func changeName(newName: String) {
        self.name = newName
    }
}

class Animal {
    var name: String = ""
    
    func changeName(newName: String) {
        self.name = newName
    }
}

var a = User()
a.name = "abc"
var b = a
b.name = "123"
print(a.name)
print(b.name)

var x = Animal()
x.name = "abc"
x = Animal()
var y = x
y.name = "123"
print(x.name)
print(y.name)
