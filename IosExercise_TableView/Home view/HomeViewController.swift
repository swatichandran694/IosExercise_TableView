//
//  HomeViewController.swift
//  IosAssignment
//
//  Created by Swati Chandran on 09/01/20.
//  Copyright © 2020 SwatiChandran. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .green
        safeArea = view.layoutMarginsGuide
        setupTableView()
        
    }
}
    extension HomeViewController: UITableViewDataSource , UITableViewDelegate{
        
        func setupTableView() {
            
            view.addSubview(tableView)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            tableView.register(DetailsTableViewCell.self, forCellReuseIdentifier: "cell")
            tableView.dataSource = self
            tableView.delegate = self
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.selectionStyle = .none
            cell.textLabel?.text = "test data"
            return cell
        }
}
