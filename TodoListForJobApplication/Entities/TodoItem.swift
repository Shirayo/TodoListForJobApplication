//
//  TodoItem.swift
//  TodoListForJobApplication
//
//  Created by Shirayo on 29/01/2025.
//

import Foundation

struct TodoItem: Identifiable, Decodable {
    var id: Int
    var title: String
    var description: String
    var date: Date
    var completed: Bool
}
