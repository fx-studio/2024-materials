//
//  Counter.swift
//  ObservationDemo
//
//  Created by Tien Le P. VN.Danang on 1/30/24.
//

import Foundation
import SwiftUI

@Observable class Store {
    var count: Int = 0
    var name: String = ""
    
    init(count: Int = 0) {
        self.count = count
    }
}
