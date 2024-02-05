//
//  ThirdView.swift
//  ObservationDemo
//
//  Created by Tien Le P. VN.Danang on 1/30/24.
//

import SwiftUI

struct ThirdView: View {
    
    @State var store = Store()
    
    var body: some View {
        SubThirdView(store: store)
    }
}

struct SubThirdView: View {
    let store : Store
    
    var body: some View {
        Text("Count: \(store.count)")
        Button("Tap +1") {
            store.count += 1
        }
        .buttonStyle(.bordered)
    }
}

#Preview {
    ThirdView()
}
