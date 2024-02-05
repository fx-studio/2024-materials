//
//  CounterView.swift
//  ObservationDemo
//
//  Created by Tien Le P. VN.Danang on 1/30/24.
//

import SwiftUI

struct CounterView: View {
    
    @Bindable var store = Store()
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Name: \(store.name)")
                Text("Count: \(store.count)")
                Button("Tap +1") {
                    store.count += 1
                }
                .buttonStyle(.bordered)
            }
            .padding(10)
            SubCounterView(store: store)
        }
        .padding(10)
    }
}

struct SubCounterView: View {
    
    @Bindable var store: Store
    
    var body: some View {
        TextField("", text: $store.name)
            .padding(10)
            .background(Color.accentColor)
    }
}

#Preview {
    CounterView()
}
