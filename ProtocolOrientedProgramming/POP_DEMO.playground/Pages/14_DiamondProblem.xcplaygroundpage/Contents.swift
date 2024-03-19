//: [Previous](@previous)

import Foundation

protocol A {
    func foo()
}

extension A {
    func foo() {
        print("A foo")
    }
}

protocol B: A {
    func foo()
}

extension B {
    func foo() {
        print("B foo")
    }
}

protocol C: A {
    func foo()
}

extension C {
    func foo() {
        print("C foo")
    }
}

struct D: B, C {
    func foo() {
        print("D foo")
    }
}

example(of: "Diamond Problem") {
    let d = D()
    d.foo() // What will this print?
}

//: [Next](@next)
