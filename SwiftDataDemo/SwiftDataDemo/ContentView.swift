//
//  ContentView.swift
//  SwiftDataDemo
//
//  Created by Tien Le P. VN.Danang on 12/26/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    //Context
    @Environment(\.modelContext) private var modelContext
    //New Item
    @State var isShowAlert = false
    @State var taskContent = ""
    //Sort
    @State var sort = SortDescriptor(\TodoItem.createDate)
    //Search
    @State var keySearch = ""

    var body: some View {
        NavigationStack {
            TodoListView(sort: sort, keySearch: keySearch)
                // navigation bar
                .navigationTitle("To do list")
                // toolbar
                .toolbar{
                    HStack {
                        //Sort
                        if sort.order == .forward {
                            Button("", systemImage: "arrow.down.to.line") {
                                sort = SortDescriptor(\TodoItem.createDate, order: .reverse)
                            }
                        } else {
                            Button("", systemImage: "arrow.up.to.line") {
                                sort = SortDescriptor(\TodoItem.createDate, order: .forward)
                            }
                        }
                        //Add
                        Button("", systemImage: "plus") {
                            // random add item
                            //modelContext.insert(Helper.generateRandomToDoItem())
                            isShowAlert.toggle()
                        }
                    }
                }
                //search bar
                .searchable(text: $keySearch, prompt: "Seach")
                //alert
                .alert("Add new task", isPresented: $isShowAlert) {
                    TextField("Content", text: $taskContent)
                                    .textInputAutocapitalization(.never)
                    Button("OK", action: {
                            addNewTask()
                    })
                    Button("Cancel", role: .cancel) { }
            }
        }
    }
    
    
    func addNewTask() {
        let task = TodoItem(name: taskContent, isComplete: false)
        modelContext.insert(task)
        taskContent = ""
        isShowAlert = false
    }
}

#Preview {
    ContentView()
        .modelContainer(for: TodoItem.self)
}
