//: # Protocol-oriented programming in Swift

import UIKit

protocol Flyable {
    var airspeedVelocity: Double { get }
}

// Mở rộng giao thức để cung cấp một triển khai mặc định
extension Flyable {
    var airspeedVelocity: Double {
        return 1000.0
    }
}

// Định nghĩa một lớp tuân thủ giao thức
class Bird: Flyable {
    var airspeedVelocity: Double {
        return 500.0
    }
}

example(of: "POP") {
    // Sử dụng giao thức như một kiểu
    func race(competitor: Flyable) {
        print("Racing at speed: \(competitor.airspeedVelocity)")
    }

    let bird = Bird()
    race(competitor: bird) // In ra: "Racing at speed: 500.0"
}

//: [Next](@next)
