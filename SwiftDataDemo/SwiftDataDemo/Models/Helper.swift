//
//  Helper.swift
//  SwiftDataDemo
//
//  Created by Tien Le P. VN.Danang on 12/26/23.
//

import Foundation

class Helper {
    static func generateRandomToDoItem() -> TodoItem {
        let tasks = [ "Mua sắm",
                     "Công việc",
                     "Thể dục",
                     "Ăn uống",
                     "Giải trí",
                     "Viết bài",
                     "Dọn dẹp",
                     "Bạn bè",
                     "Hóa đơn" ]
        
        let randomIndex = Int.random(in: 0..<tasks.count)
        let randomTask = tasks[randomIndex]
        
        return TodoItem(name: randomTask, isComplete: Bool.random())
    }
    
    static func generateByTime() -> TodoItem {
        return TodoItem(name: Date().toString(dateFormat: "yyyy:MM:dd hh:mm:ss"), isComplete: Bool.random())
    }

}

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}
