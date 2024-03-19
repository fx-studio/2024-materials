//: [Previous](@previous)

import Foundation

protocol Copyable {
    func copy() -> Self
}

class MyClass: Copyable {
    var num = 1

    func copy() -> Self {
        let result = type(of: self).init()
        result.num = num
        return result
    }
    
    required init() {
    }
}

example(of: "Protocol with Self Requirements") {
    let object = MyClass()
    object.num = 5

    let newObject = object.copy()
    print(newObject.num) // Outputs: 5
}

//: [Next](@next)
