//: [Previous](@previous)

import Foundation

protocol CanFly {
    func fly()
}

class Bird: CanFly {
    func fly() {
        print("The bird flies")
    }
}

class Airplane: CanFly {
    func fly() {
        print("The airplane flies")
    }
}

func makeItFly(flyer: CanFly) {
    flyer.fly()
}

example(of: "Protocol Types") {
    let bird = Bird()
    let airplane = Airplane()

    makeItFly(flyer: bird) // Outputs: The bird flies
    makeItFly(flyer: airplane) // Outputs: The airplane flies
}

//: [Next](@next)
