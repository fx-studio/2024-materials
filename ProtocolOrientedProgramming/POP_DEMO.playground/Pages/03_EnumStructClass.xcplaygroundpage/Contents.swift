//: [Previous](@previous)

import Foundation

// Định nghĩa giao thức
protocol CanFly {
    func fly()
}

// Tạo Enum Bird tuân theo giao thức CanFly
enum Bird: CanFly {
    case eagle, penguin, swift

    func fly() {
        switch self {
        case .eagle:
            print("The eagle is flying")
        case .penguin:
            print("Penguins can't fly!")
        case .swift:
            print("The swift bird is flying")
        }
    }
}

// Tạo Struct Airplane tuân theo giao thức CanFly
struct Airplane: CanFly {
    func fly() {
        print("The airplane is flying")
    }
}

// Tạo Class Helicopter tuân theo giao thức CanFly
class Helicopter: CanFly {
    func fly() {
        print("The helicopter is flying")
    }
}

// Tạo một hàm để thử nghiệm
func letItFly(flyer: CanFly) {
    flyer.fly()
}

example(of: "Enum, Struct, Class") {
    // Tạo một đối tượng Bird, Airplane và Helicopter
    let eagle = Bird.eagle
    let airplane = Airplane()
    let helicopter = Helicopter()

    // Gọi hàm letItFly với eagle, airplane và helicopter
    letItFly(flyer: eagle)
    letItFly(flyer: airplane)
    letItFly(flyer: helicopter)

}

//: [Next](@next)
