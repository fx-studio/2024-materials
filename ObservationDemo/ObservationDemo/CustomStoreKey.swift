//
//  CustomStoreKey.swift
//  ObservationDemo
//
//  Created by Tien Le P. VN.Danang on 1/30/24.
//

import Foundation
import SwiftUI

struct CustomStoreKey: EnvironmentKey {
    static var defaultValue = Store()
}

extension EnvironmentValues {
    var store: Store {
        get { self[CustomStoreKey.self] }
        set { self[CustomStoreKey.self] = newValue }
    }
}
