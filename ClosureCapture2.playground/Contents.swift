import UIKit

func someFunc() -> () -> Int {
    var p = 0
    
    func closure() -> Int {
        p += 10
        
        return p
    }
    
    return closure
}

let someFuncObject = someFunc()

print(someFuncObject())
print(someFuncObject())
print(someFuncObject())
