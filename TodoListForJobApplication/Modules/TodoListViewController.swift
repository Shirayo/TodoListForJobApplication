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

final class TodoListViewController: UIViewController, TodoListViewProtocol, UITableViewDataSource, UITableViewDelegate,  UISearchControllerDelegate, UISearchResultsUpdating {
    
    var presenter: TodoListPresenterProtocol!
    
    var todos: [TodoItem] = [.init(id: 0, title: "Title", description: "Description", date: .now, completed: false)]
    
    var tableView: UITableView = {
        var tableView = UITableView()
        tableView.allowsSelection = true
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var button: UIButton = {
        var button = UIButton()
        button.setTitle("Test", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(TodoListViewController.self, action: #selector(testButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Todo List"
        navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.sizeToFit()
     

        view.backgroundColor = .white
//        view.addSubview(button)
//        NSLayoutConstraint.activate([
//            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
          tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
          tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
          tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
          tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        
        initSearchController()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    func initSearchController() {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.returnKeyType = .done
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.scopeButtonTitles = ["All", "Completed", "Uncompleted"]
//        searchController.searchBar.showsScopeBar = true
        searchController.delegate = self
    }
    
    @objc func testButtonTapped() {
        print("heh")
    }
    
    //MARK: - UISearchResultsUpdating
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //MARK: - Table View Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
              fatalError("The TableView coult not dequeue a CustomCell in ViewController")
            }       
        cell.configure(with: todos[indexPath.row])
        return cell
    }
}


class CustomCell: UITableViewCell {
    
    static let identifier = "customCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 90).isActive = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with todo: TodoItem) {
        self.titleLabel.text = todo.title
      }
    
    private func setupUI() {
        self.contentView.addSubview(self.titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
        ])
    }
}
