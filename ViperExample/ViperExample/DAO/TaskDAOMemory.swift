//
//  TaskMemoryDAO.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

// WARNING: This class doesn't access a database. It just represent a data access layer for this projects.

import Foundation

class TaskDAOMemory : TaskDAOProtocol {
    
    static var list: [Task]?
    
    init() {
        if TaskDAOMemory.list == nil {
            let task1 = Task(text: "Do it")
            let task2 = Task(text: "Do that")
            let task3 = Task(text: "Do everything")
            
            TaskDAOMemory.list = [task1, task2, task3]
        }
    }
    
    // MARK: TaskDAO
    
    func saveTask(task: Task) {
        TaskDAOMemory.list?.append(task)
    }
    
    func loadTasks() -> [Task]? {
        return TaskDAOMemory.list
    }

}
