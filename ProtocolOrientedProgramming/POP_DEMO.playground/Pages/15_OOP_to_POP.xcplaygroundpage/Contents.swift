//: [Previous](@previous)

import Foundation

class Bird_OOP {
    var name: String
    var canFly: Bool

    init(name: String, canFly: Bool) {
        self.name = name
        self.canFly = canFly
    }

    func fly() {
        if canFly {
            print("\(name) can fly")
        } else {
            print("\(name) can't fly")
        }
    }
}


example(of: "OOP to POP (1)") {
    let penguin = Bird_OOP(name: "Penguin", canFly: false)
    penguin.fly() // Prints "Penguin can't fly"
}

protocol Bird {
    var name: String { get set }
    var canFly: Bool { get }
}

protocol Flyable {
    func fly()
}

extension Bird where Self: Flyable {
    func fly() {
        print("\(name) can fly")
    }
}

struct Penguin: Bird {
    var name: String
    var canFly: Bool {
        return false
    }
}

struct Eagle: Bird, Flyable {
    var name: String
    var canFly: Bool {
        return true
    }
}

example(of: "OOP to POP (2)") {

    let penguin = Penguin(name: "Penguin")
    let eagle = Eagle(name: "Eagle")
    eagle.fly() // Prints "Eagle can fly"
}

//: [Next](@next)
