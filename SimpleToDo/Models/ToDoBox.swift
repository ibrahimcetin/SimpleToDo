//
//  ToDoBox.swift
//  SimpleToDo
//
//  Created by İbrahim Çetin on 28.12.2022.
//

import Foundation


class ToDoBox: ObservableObject {
    @Published var items: [ToDo] = [] {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "todos")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "todos") {
            if let decoded = try? JSONDecoder().decode([ToDo].self, from: data) {
                items = decoded
            }
        }
    }
}
