//
//  ContentView.swift
//  SimpleToDo
//
//  Created by İbrahim Çetin on 28.12.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var todos = ToDoBox()
    
    var body: some View {
        NavigationStack {
            HomeView(todos: todos)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
