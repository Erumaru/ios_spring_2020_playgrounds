import UIKit
import Foundation

enum StringEnum: String {
    case w = "w"
    case m = "m"
}

enum IntEnum: Int {
    case w = 0
    case m = 1
}

StringEnum.w
let w = StringEnum(rawValue: "w")
//w?.rawValue
//print(w)

enum Operation {
    case equals
    case constant(value: Double)
    case binary(function: (Double, Double) -> Double)
    case unary(function: (Double) -> Double)
}

var map: [String : Operation] = [
    "+" : .binary(function: { $0 + $1 }),
    "*" : .binary(function: { $0 * $1 }),
    "pi" : .constant(value: Double.pi)
]

let operation = map["*"]!

switch operation {
case .binary(let function):
    print(function(5, 5) + function(1,2))
case .constant(let value):
    print(value)
default: break
}
