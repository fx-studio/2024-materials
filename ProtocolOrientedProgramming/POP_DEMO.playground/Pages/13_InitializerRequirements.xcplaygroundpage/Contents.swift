//: [Previous](@previous)

import Foundation

protocol Initializable {
    init(value: Int)
}

class MyClass: Initializable {
    var value: Int
    
    required init(value: Int) {
        self.value = value
    }
}

example(of: "Protocol with Initializer Requirements") {
    let object = MyClass(value: 5)
    print(object.value) // Outputs: 5
}

//: [Next](@next)
