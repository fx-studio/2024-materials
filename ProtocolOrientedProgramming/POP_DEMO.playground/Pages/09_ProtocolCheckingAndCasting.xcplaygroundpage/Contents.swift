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

example(of: "Checking And Casting") {
    let bird: CanFly = Bird()
    let airplane: CanFly = Airplane()

    if bird is Bird {
        print("This flyer is a bird")
    }

    if let birdAsBird = bird as? Bird {
        birdAsBird.fly() // Outputs: The bird flies
    }

    if let airplaneAsAirplane = airplane as? Airplane {
        airplaneAsAirplane.fly() // Outputs: The airplane flies
    }

}
//: [Next](@next)
