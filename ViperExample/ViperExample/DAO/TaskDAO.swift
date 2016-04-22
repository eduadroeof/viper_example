//
//  TaskDAO.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import Foundation

protocol TaskDAO {
    func saveTask(task: Task)
    func loadTasks() -> [Task]?
}