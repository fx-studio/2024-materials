//: [Previous](@previous)

import Foundation

// Định nghĩa một giao thức
protocol CanFly {
    var altitude: Double { get }
    func ascend()
}

// Mở rộng giao thức để cung cấp một triển khai mặc định
extension CanFly {
    var altitude: Double {
        return 1000.0
    }

    func ascend() {
        print("Ascending to \(altitude) feet.")
    }
}

example(of: "Protocol Extension") {
    // Định nghĩa một lớp tuân thủ giao thức
    class Bird: CanFly {
        // Không cần cung cấp triển khai cho 'altitude' và 'ascend' vì đã có triển khai mặc định từ giao thức
    }

    let bird = Bird()
    bird.ascend() // In ra: "Ascending to 1000.0 feet."
}

//: [Next](@next)
