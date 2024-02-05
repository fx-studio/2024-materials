//
//  SecondView.swift
//  ObservationDemo
//
//  Created by Tien Le P. VN.Danang on 1/30/24.
//

import SwiftUI

struct SecondView: View {
    
    @Environment(Store.self) var store: Store?
    
    var body: some View {
        if let count = store?.count {
            Text("Count: \(count)")
            Button("+1") {
                store?.count += 1
            }
            .buttonStyle(.bordered)
        } else {
            Text("N/A")
        }
    }
}

#Preview {
    var testStore = Store(count: 8888)
    
    return SecondView()
        .environment(testStore)
}
