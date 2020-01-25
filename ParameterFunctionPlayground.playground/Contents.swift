import UIKit
import Foundation

func execute(f: (Int, Int) -> Int) {
    print(f(10, 5))
}

func plus(a: Int, b: Int) -> Int {
    return a + b
}

execute(f: plus)

execute(f: { a, b in
    return a + b
})

execute { a, b in
    return a + b
}

execute {
    return $0 + $1
}

execute { $0 + $1 }
