//: [Previous](@previous)

import Foundation

// Khai báo
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

// Struct
struct IntContainer: Container {
    typealias Item = Int
    var items = [Int]()
    
    mutating func append(_ item: Int) {
        items.append(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}

example(of: "Struct with Associated Value") {
    var container = IntContainer()
    container.append(12)
    print(container.count) // Prints "1"
    print(container[0]) // Prints "12"
}

// Enum
enum Stack<Element>: Container {
    case empty
    indirect case node(Element, next: Stack<Element>)

    mutating func append(_ item: Element) {
        self = .node(item, next: self)
    }

    var count: Int {
        switch self {
        case .empty: return 0
        case let .node(_, next): return next.count + 1
        }
    }

    subscript(i: Int) -> Element {
        switch self {
        case .empty: fatalError("Index out of range")
        case let .node(x, next):
            if i == 0 {
                return x
            } else {
                return next[i - 1]
            }
        }
    }
}

example(of: "Enum with Associated value") {
    var stack = Stack<Int>.empty
    stack.append(10)
    stack.append(20)
    print(stack.count) // Prints "2"
    print(stack[1]) // Prints "10"
}

//: [Next](@next)
