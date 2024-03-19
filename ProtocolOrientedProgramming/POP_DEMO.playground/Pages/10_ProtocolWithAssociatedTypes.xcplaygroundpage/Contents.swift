//: [Previous](@previous)

import Foundation

protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct IntContainer: Container {
    typealias Item = Int
    var items = [Item]()
    
    mutating func append(_ item: Item) {
        items.append(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Item {
        return items[i]
    }
}

example(of: "Protocol with Associated Values") {
    var container = IntContainer()
    container.append(12)
    print(container.count) // Outputs: 1
    print(container[0]) // Outputs: 12
}

//: [Next](@next)
