//
//  ObservationDemoApp.swift
//  ObservationDemo
//
//  Created by Tien Le P. VN.Danang on 1/30/24.
//

import SwiftUI

@main
struct ObservationDemoApp: App {
    
    @State private var myStore = Store(count: 9999)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.store, myStore)
        }
    }
}
