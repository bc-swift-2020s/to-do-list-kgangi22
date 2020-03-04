//
//  ToDoItem.swift
//  ToDo List
//
//  Created by Kyle Gangi on 2/8/20.
//  Copyright © 2020 Kyle Gangi. All rights reserved.
//

import Foundation


struct ToDoItem: Codable {
    var name: String
    var date: Date
    var notes: String
    var reminderSet: Bool
    var notificationID: String?
    var completed: Bool
}
