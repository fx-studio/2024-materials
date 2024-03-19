//: [Previous](@previous)

import Foundation

protocol CanMakeNoise {
    func makeNoise()
}

enum Animal: CanMakeNoise {
    case cat, dog, cow

    func makeNoise() {
        switch self {
        case .cat:
            print("Meow!")
        case .dog:
            print("Woof!")
        case .cow:
            print("Moo!")
        }
    }
}

example(of: "Enum as a replacement for class") {
    let animals: [CanMakeNoise] = [Animal.cat, Animal.dog, Animal.cow]
    animals.forEach { $0.makeNoise() }
}

//: [Next](@next)
