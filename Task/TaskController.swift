//
//  TaskController.swift
//  Task
//
//  Created by Jason Mandozzi on 6/19/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

import Foundation

import CoreData

class TaskController {
    
    //Shared Instance
    static var shared = TaskController()
    
    //Source of Truth
    var tasks: [Task?] = []
    
    func add(taskWithName name: String, notes: String?, due: Date?) {
        
    }
    
    func update(task: Task, name: String?, due: Date?) {
        
    }
    
    func remove(task: Task) {
        
    }
    
    func saveToPersistentStore() {
    
    }
    
    func fetchTasks() -> [Task] {
        
    }
    
}
