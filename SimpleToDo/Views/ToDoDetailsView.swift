//
//  ToDoDetailsView.swift
//  SimpleToDo
//
//  Created by İbrahim Çetin on 28.12.2022.
//

import SwiftUI

struct ToDoDetailsView: View {
    let todo: ToDo
    let doneAction: () -> Void
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .leading) {
                    Text(todo.details)
                        .strikethrough(todo.isDone)
                    
                    HStack {
                        Spacer()

                        Text(todo.date.formatted(date: .complete, time: .shortened))
                            .font(.callout)
                            .frame(maxWidth: geo.size.width / 2)
                            .padding(.vertical)
                    }
                    
                }
                .navigationTitle(todo.title)
                .padding(.horizontal)
                .toolbar {
                    Button(todo.isDone ? "Ongoing" : "Done") {
                        doneAction()
                        dismiss()
                    }
                }
            }
        }
    }
}

struct ToDoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoDetailsView(todo: ToDo(title: "Lunch", details: "Buy a tomato", date: Date.now)) { }
    }
}
