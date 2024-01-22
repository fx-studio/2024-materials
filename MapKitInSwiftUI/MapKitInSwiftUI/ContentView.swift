//
//  ContentView.swift
//  MapKitInSwiftUI
//
//  Created by Tien Le P. VN.Danang on 1/22/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    
    
    @State private var position: MapCameraPosition = .automatic
    
    
    var body: some View {
        VStack {
            VStack {
                Map(position: $position)
                    .animation(.easeIn, value: position)
                HStack {
                    //region #1
                    Button {
                        position = .region(MKCoordinateRegion.turtleTower)
                    } label: {
                        Label("1", systemImage: "1.square.fill")
                    }
                    .buttonStyle(.borderedProminent)
                    
                    //region #2
                    Button {
                        position = .region(MKCoordinateRegion.dragonBridge)
                    } label: {
                        Label("2", systemImage: "2.square.fill")
                    }
                    .buttonStyle(.borderedProminent)
                    
                    //region #3
                    Button {
                        position = .region(MKCoordinateRegion.benthanhMarket)
                    } label: {
                        Label("3", systemImage: "3.square.fill")
                    }
                    .buttonStyle(.borderedProminent)
                }
                .labelStyle(.iconOnly)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

// MARK: - Extensions
extension CLLocationCoordinate2D {
    static let turtleTower = CLLocationCoordinate2D(latitude: 21.027910, longitude: 105.852298)
    static let dragonBridge = CLLocationCoordinate2D(latitude: 16.06101183799654, longitude: 108.22761720565889)
    static let benthanhMarket = CLLocationCoordinate2D(latitude: 10.772823166683567, longitude: 106.69893065796946)
}

extension MKCoordinateRegion {
    static let turtleTower = MKCoordinateRegion(
        center: CLLocationCoordinate2D.turtleTower,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    static let dragonBridge = MKCoordinateRegion(
        center: CLLocationCoordinate2D.dragonBridge,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    static let benthanhMarket = MKCoordinateRegion(
        center: CLLocationCoordinate2D.benthanhMarket,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
}
