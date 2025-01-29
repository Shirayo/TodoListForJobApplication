//
//  TodoListPresenter.swift
//  TodoListForJobApplication
//
//  Created by Shirayo on 29/01/2025.
//

import Foundation

protocol TodoListPresenterProtocol: AnyObject {
    
}


final class TodoListPresenter: TodoListPresenterProtocol {
    weak var view: TodoListViewProtocol?
    var interactor: TodoListInteractorProtocol!
    var router: TodoListRouterProtocol!
}
