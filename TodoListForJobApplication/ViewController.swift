//
//  ViewController.swift
//  TodoListForJobApplication
//
//  Created by Shirayo on 29/01/2025.
//

import UIKit

class ViewController: UIViewController {
    
    var button: UIButton = {
        var button = UIButton()
        button.titleLabel?.text = "Test"
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.title = "Todo List"
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }


}

