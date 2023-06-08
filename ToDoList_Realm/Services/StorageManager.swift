//
//  StorageManager.swift
//  ToDoList_Realm
//
//  Created by Артём Латушкин on 07.06.2023.
//

import Foundation
import RealmSwift

final class StorageManager {
    static let shared = StorageManager()
    
    let realm: Realm
    
    private init() {
        do {
            realm = try Realm()
        } catch {
            fatalError("Failed to initialize Realm: \(error)")
        }
    }
    
    // MARK: - Task List
    func save(_ taskLists: [TaskList]) {
        write {
            realm.add(taskLists)
        }
    }
    
    func save(_ taskList: String, completion: (TaskList) -> Void) {
        write {
            let taskList = TaskList(value: [taskList])
            realm.add(taskList)
            completion(taskList)
        }
    }
    
    func delete(_ taskList: TaskList) {
        write {
            realm.delete(taskList.tasks)
            realm.delete(taskList)
        }
    }
    
    func edit(_ taskLists: TaskList, newValue: String) {
        write {
            taskLists.title = newValue
        }
    }
    
    func done(_ taskLists: TaskList) {
        write {
            taskLists.tasks.setValue(true, forKey: "isComplete")
        }
    }
    
    //MARK: - Tasks
    func save(_ task: String, withNote note: String, to taskList: TaskList, completion: (Task) -> Void) {
        write {
            let task = Task(value: [task, note])
            taskList.tasks.append(task)
            completion(task)
        }
    }
    
    
    func delete(_ task: Task) {
        write {
            realm.delete(task)
        }
    }
    
    func edit(_ task: Task, to newValue: String, withNote note: String) {
        write {
            task.title = newValue
            task.note = note
        }
    }
    
    func done(_ task: Task) {
        write {
            task.isComplete.toggle()
        }
    }
    
    private func write(completion: () -> Void) {
        do {
            try realm.write {
                completion()
            }
        } catch {
            print(error)
        }
    }
}

