//: [Previous](@previous)

import Foundation

protocol Printable {
    func printDetails()
}

protocol Loggable {
    func logDetails()
}

// Protocol Inheritance
protocol Item: Printable, Loggable {
    var name: String { get set }
}

class Product: Item {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func printDetails() {
        print("Printing Details for Item: \(name)")
    }
    
    func logDetails() {
        print("Logging Details for Item: \(name)")
    }
}

example(of: "Protocol Inheritance") {
    let item: Item = Product(name: "Apple")
    item.printDetails() // In ra: Printing Details for Item: Apple
    item.logDetails() // In ra: Logging Details for Item: Apple
}

//: [Next](@next)
