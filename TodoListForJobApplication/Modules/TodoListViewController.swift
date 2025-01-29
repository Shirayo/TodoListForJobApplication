//
//  TodoListViewController.swift
//  TodoListForJobApplication
//
//  Created by Shirayo on 29/01/2025.
//

import Foundation
import UIKit

protocol TodoListViewProtocol: AnyObject {
    
}

final class TodoListViewController: UIViewController, TodoListViewProtocol {
    var presenter: TodoListPresenterProtocol!
    
    
}
