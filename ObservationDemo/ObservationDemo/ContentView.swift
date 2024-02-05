//
//  ContentView.swift
//  ObservationDemo
//
//  Created by Tien Le P. VN.Danang on 1/30/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.store) private var store
    
    var body: some View {
        Text("Count: \(store.count)")
        Button("Tap +1") {
            store.count += 1
        }
        .buttonStyle(.bordered)
    }
}

#Preview {
    ContentView()
}
