//
//  TableViewController.swift
//  MVVM
//
//  Created by camil karam on 3/19/18.
//  Copyright © 2018 CamilKaram. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

open class TableViewController: UITableViewController
{
    let dataSource = CarsDataSource()
    
    lazy var viewModel : TableViewViewModel = {
        let viewModel = TableViewViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        //set DataSource
        self.tableView.dataSource = self.dataSource
        //bind tableView Controller  to datasource changes
        self.dataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.tableView.reloadData()
        }
        //fetch data
        self.viewModel.fetchCars()
    }
}
