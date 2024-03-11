//
//  TodoListView.swift
//  SwiftDataDemo
//
//  Created by Tien Le P. VN.Danang on 12/26/23.
//

import SwiftUI
import SwiftData

struct TodoListView: View {
    
    //Query
    @Query var todoItems: [TodoItem]
    //Context
    @Environment(\.modelContext) private var modelContext
    
    init(sort: SortDescriptor<TodoItem>, keySearch: String = "") {
        
        //Query with Filter & Sort
        if keySearch.count > 0 {
            _todoItems = Query(filter: #Predicate<TodoItem> { $0.name.contains(keySearch)},
                               sort: [sort])
        } else {
            _todoItems = Query(filter: #Predicate<TodoItem> { !$0.name.isEmpty},
                               sort: [sort])
        }
    }
    
    var body: some View {
        List {
            ForEach(todoItems) { item in
                //Row
                HStack {
                    VStack (alignment: .leading) {
                        Text(item.name)
                        Text(item.createDate.toString(dateFormat: "yyyy:MM:dd hh:mm:ss"))
                            .fontWeight(.thin)
                            .italic()
                    }
                    
                    Spacer()
                    
                    if item.isComplete {
                        Image(systemName: "checkmark")
                    }
                }
                // select row
                .onTapGesture {
                    item.isComplete.toggle()
                }
            }
            // Delete
            .onDelete(perform: { indexSet in
                for index in indexSet {
                    let itemToDelete = todoItems[index]
                    modelContext.delete(itemToDelete)
                }
            })
        }
    }

}

#Preview {
    TodoListView(sort: SortDescriptor(\TodoItem.name))
        .modelContainer(for: TodoItem.self)
}
