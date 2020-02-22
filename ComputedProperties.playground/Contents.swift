import UIKit
import Foundation

var a = 5
var b = 3
var sum: Int {
    return a + b
}

func sum(a: Int, b: Int) -> Int {
    return a + b
}

print("\(a) \(b) \(sum)")

a = 10
b = 7

print("\(a) \(b) \(sum(a: a, b: sum))")

