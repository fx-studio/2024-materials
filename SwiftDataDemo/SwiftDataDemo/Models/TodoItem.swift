//
//  TodoItem.swift
//  SwiftDataDemo
//
//  Created by Tien Le P. VN.Danang on 12/26/23.
//

import Foundation
import SwiftData

@Model class TodoItem {
    var id: UUID
    var name: String
    var isComplete: Bool
    var createDate: Date
    
    init(id: UUID = UUID(), name: String = "", isComplete: Bool = false, createDate: Date = Date()) {
        self.id = id
        self.name = name
        self.isComplete = isComplete
        self.createDate = createDate
    }
}
