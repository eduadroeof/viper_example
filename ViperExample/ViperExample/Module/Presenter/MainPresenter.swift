//
//  MainPresenter.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import Foundation

class MainPresenter : MainPresenterProtocol  {
    var interactor: MainInteractorInputProtocol?
    var wireframe: MainWireframeProtocol?
    
    weak var view: MainViewProtocol?
    
    // MARK: MainPresenterProtocol methods
    
    func updateView() {
        interactor?.fetchToDoList()
    }
    
}

// MARK: MainInteractorOutputProtocol

extension MainPresenter : MainInteractorOutputProtocol {

    func didFetchToDoList(toDoList: [ToDo]) {
        let textList = extractTextsFromToDoList(toDoList)
        view?.showToDoList(textList)
    }
    
    func didFailFetchToDoList(error: ErrorType) {
        
    }
    
    // MARK: Private
    
    private func extractTextsFromToDoList(toDoList: [ToDo]) -> [String] {
        var textList: [String] = []
        for todo in toDoList {
            textList.append(todo.text)
        }
        
        return textList
    }
    
}
