//
//  ToDoLabelView.swift
//  SimpleToDo
//
//  Created by İbrahim Çetin on 28.12.2022.
//

import SwiftUI

struct ToDoLabelView: View {
    let todo: ToDo
    
    var body: some View {
        HStack {
            VStack {
                Text(todo.date.formatted(date: .omitted, time: .shortened))
                Text(todo.date.formatted(.dateTime.day().month()))
            }
            .font(.subheadline)
            
            VStack(alignment: .leading) {
                Text(todo.title)
                    .font(.title2)
                
                if todo.details.isNotEmpty {
                    Text(todo.details)
                        .font(.subheadline)
                }
            }
            .padding(.horizontal)
            .lineLimit(1)
            .strikethrough(todo.isDone)
        }
        .padding(.vertical, 5)
    }
}

struct ToDoLabelView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoLabelView(todo: ToDo(title: "Lunch", details: "Buy a tomato", date: Date.now))
    }
}
