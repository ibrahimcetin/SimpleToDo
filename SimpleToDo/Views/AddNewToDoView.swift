//
//  AddNewToDoView.swift
//  SimpleToDo
//
//  Created by İbrahim Çetin on 28.12.2022.
//

import SwiftUI

struct AddNewToDoView: View {
    let action: (ToDo) -> Void
    
    @State private var todoTitle = ""
    @State private var todoDetails = ""
    @State private var todoDate = Date.now
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        List {
            Section {
                TextField("ToDo Title", text: $todoTitle)
                
                TextField("ToDo Details", text: $todoDetails, axis: .vertical)
            }
            
            Section {
                DatePicker("Date ToDo", selection: $todoDate, in: Date.now...)
            }
            
            Section {
                Button {
                    let item = ToDo(title: todoTitle, details: todoDetails, date: todoDate)
                    
                    action(item)
                    
                    dismiss()
                } label: {
                    Text("Add ToDo")
                        .frame(maxWidth: .infinity)
                }
            }
        }
        .navigationTitle("Add New ToDo")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddNewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewToDoView() { _ in
            
        }
    }
}
