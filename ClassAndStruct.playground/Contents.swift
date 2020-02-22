import UIKit
import Foundation

struct User {
    var name: String = ""
}

class Animal {
    var name: String = ""
}

//var a = User()
//a.name = "abc"
//var b = a
//b.name = "123"
//print(a.name)
//print(b.name)


var x = Animal()
x.name = "abc"
var y = x
y.name = "123"
print(x.name)
print(y.name)
