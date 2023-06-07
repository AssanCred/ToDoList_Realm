//
//  TaskList.swift
//  ToDoList_Realm
//
//  Created by Артём Латушкин on 07.06.2023.
//

import Foundation

final class TaskList {
    var title = ""
    var date = Date()
    var tasks: [Task] = []
}

final class Task {
    var title = ""
    var note = ""
    var date = Date()
    var isComplite = false
}
