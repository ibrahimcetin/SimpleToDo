//
//  HomeView.swift
//  SimpleToDo
//
//  Created by İbrahim Çetin on 28.12.2022.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var todos: ToDoBox
    
    @State private var searchText = ""
    @State private var showingSheet = false
    
    var body: some View {
        List {
            ForEach(searchResults) {item in
                NavigationLink(value: item) {
                    ToDoLabelView(todo: item)
                        .swipeActions(edge: .leading) {
                            Button(item.isDone ? "Ongoing" : "Done") {
                                doneTodo(item: item)
                            }
                            .tint(item.isDone ? .gray : .green)
                        }
                }
            }
            .onDelete(perform: removeRows)
        }
        .navigationTitle("Simple ToDo")
        .searchable(text: $searchText)
        .sheet(isPresented: $showingSheet) {
            NavigationStack {
                AddNewToDoView() {
                    todos.items.append($0)
                }
            }
        }
        .toolbar {
            Button {
                showingSheet = true
            } label: {
                Image(systemName: "plus")
            }

        }
        .navigationDestination(for: ToDo.self) { item in
            ToDoDetailsView(todo: item) {
                doneTodo(item: item)
            }
        }
    }
    
    var searchResults: [ToDo] {
        if searchText.isEmpty {
            return todos.items
        } else {
            return todos.items.filter {
                $0.title.contains(searchText)
            }
        }
    }
    
    func doneTodo(item: ToDo) {
        let index = todos.items.firstIndex(of: item)!
        todos.items[index].isDone.toggle()
    }
    
    func removeRows(offsets: IndexSet) {
        todos.items.remove(atOffsets: offsets)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(todos: ToDoBox())
    }
}
