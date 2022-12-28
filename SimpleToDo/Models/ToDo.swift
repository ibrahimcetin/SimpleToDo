//
//  ToDo.swift
//  SimpleToDo
//
//  Created by İbrahim Çetin on 28.12.2022.
//

import Foundation

struct ToDo: Identifiable, Codable, Hashable {
    var id = UUID()
    let title: String
    let details: String
    let date: Date
    var isDone = false
}
