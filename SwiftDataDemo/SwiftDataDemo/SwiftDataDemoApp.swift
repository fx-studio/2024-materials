//
//  SwiftDataDemoApp.swift
//  SwiftDataDemo
//
//  Created by Tien Le P. VN.Danang on 12/26/23.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: TodoItem.self)
    }
}
