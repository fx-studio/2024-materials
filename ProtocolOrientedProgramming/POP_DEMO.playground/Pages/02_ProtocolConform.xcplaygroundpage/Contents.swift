//: [Previous](@previous)

import Foundation

// Định nghĩa một giao thức
protocol CanMakeNoise {
    func makeNoise()
}

// Định nghĩa một lớp tuân thủ giao thức
class Human: CanMakeNoise {
    func makeNoise() {
        print("Hello!")
    }
}

// Định nghĩa một cấu trúc tuân thủ giao thức
struct Cat: CanMakeNoise {
    func makeNoise() {
        print("Meow!")
    }
}

// Định nghĩa một kiểu liệt kê tuân thủ giao thức
enum Dog: CanMakeNoise {
    case small, big

    func makeNoise() {
        switch self {
        case .small:
            print("Woof!")
        case .big:
            print("WOOF!")
        }
    }
}

example(of: "Procotol Conform") {
    let human = Human()
    let cat = Cat()
    let dog = Dog.big

    human.makeNoise() // In ra: "Hello!"
    cat.makeNoise()   // In ra: "Meow!"
    dog.makeNoise()   // In ra: "WOOF!"
}

//: [Next](@next)
