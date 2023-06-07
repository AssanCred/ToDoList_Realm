//
//  StorageManager.swift
//  ToDoList_Realm
//
//  Created by Артём Латушкин on 07.06.2023.
//

import Foundation

final class StorageManager {
    static let shared = StorageManager()
    
    private init() {}
    
    // MARK: - Task List
    func save(_ taskLists: [TaskList]) {
        
    }
    
    func save(_ taskLists: String, completion: (TaskList) -> Void) {
        
    }
    
    func delete(_ taskLists: TaskList) {
        
    }
    
    func edit(_ taskLists: TaskList, newValue: String) {
        
    }
    
    func done(_ taskLists: TaskList) {
        
    }
    
    func save(_ task: String, withNote note: String, to taskList: TaskList, completion: (Task) -> Void) {
        
    }
}

