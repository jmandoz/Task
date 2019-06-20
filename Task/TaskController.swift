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
    static let shared = TaskController()
    
    //Source of Truth
    var tasks: [Task] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        return (try? CoreDataStack.context.fetch(request)) ?? []
    }
    
    func add(taskWithName name: String, notes: String?, due: Date?) {
        
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        
    }
    
    func remove(task: Task) {
        
    }
    
    func saveToPersistentStore() {
    
    }
    
    
}
