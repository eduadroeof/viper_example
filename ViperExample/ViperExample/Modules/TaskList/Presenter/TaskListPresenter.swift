//
//  TaskListPresenter.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import Foundation

class TaskListPresenter : TaskListPresenterProtocol  {
    var interactor: TaskListInteractorInputProtocol?
    var wireframe: TaskListWireframeProtocol?
    
    weak var view: TaskListViewProtocol?
    
    // MARK: ListPresenterProtocol methods
    
    func updateView() {
        interactor?.fetchList()
    }
    
    func didTapAddBarButton() {
        wireframe?.pushCreation()
    }
    
}

// MARK: ListInteractorOutputProtocol

extension TaskListPresenter : TaskListInteractorOutputProtocol {

    func didFetchList(toDoList: [Task]) {
        let textList = extractTextsFromToDoList(toDoList)
        view?.showList(textList)
    }
    
    func didFailFetchList(error: ToDoError) {
        if error == .EmptyList {
            view?.showAlert(title: "Error",
                      description: "Your ToDo list is empty! Go and find something to do!")
        }
    }
    
    // MARK: Private
    
    private func extractTextsFromToDoList(toDoList: [Task]) -> [String] {
        var textList: [String] = []
        for todo in toDoList {
            textList.append(todo.text)
        }
        
        return textList
    }
    
}
