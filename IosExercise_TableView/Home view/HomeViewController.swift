//
//  HomeViewController.swift
//  IosAssignment
//
//  Created by Swati Chandran on 09/01/20.
//  Copyright © 2020 SwatiChandran. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    var refreshControl = UIRefreshControl()
    var viewModel: DetailsViewModelProtocol = DetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .green
        safeArea = view.layoutMarginsGuide
        setupTableView()
        fetchData()
        
    }
    
    func fetchData()  {
        showActivityIndicator(isShow: true)
        DetailsAPI().getRequestWith(baseUrl+kApifacts) { (error, dataDetails) in
            DispatchQueue.main.async {
                if error  == nil {
                guard let datas = dataDetails else { return }
                self.viewModel.model = datas
                self.navigationItem.title = self.viewModel.navigationTitle
                self.tableView.reloadData()
                self.showActivityIndicator(isShow: false)
                }
                else {
                    self.showActivityIndicator(isShow: false)
                    
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title:"Ok", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
}
    extension HomeViewController: UITableViewDataSource , UITableViewDelegate{
        
        func setupTableView() {
            
            let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
            refreshControl.attributedTitle = NSAttributedString(string: "Pull down to refresh")
            tableView.refreshControl = refreshControl
            
            view.addSubview(tableView)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            tableView.register(DetailsTableViewCell.self, forCellReuseIdentifier: "cell")
            tableView.rowHeight = UITableViewAutomaticDimension
            tableView.estimatedRowHeight = 300
            tableView.dataSource = self
            tableView.delegate = self
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel.numberOfRows()
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            var cell:DetailsTableViewCell?
            if cell == nil {
                cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)  as? DetailsTableViewCell
            }
            cell!.selectionStyle = .none
            cell!.details = viewModel.itemAtIndex(index: indexPath.row)
            return cell!
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableViewAutomaticDimension
        }
        
        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            if(indexPath.row % 2 == 0) {
                cell.backgroundColor = UIColor.white
            } else {
                cell.backgroundColor =  UIColor(red: 245.0/255, green: 245.0/255, blue: 245.0/255, alpha: 1.0)
            }
        }
        
        @objc func refreshData(refreshControl: UIRefreshControl) {
            fetchData()
            refreshControl.endRefreshing()
        }
}
