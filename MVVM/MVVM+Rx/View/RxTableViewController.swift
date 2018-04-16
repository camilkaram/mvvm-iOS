//
//  RxTableViewController.swift
//  MVVM
//
//  Created by camil karam on 3/30/18.
//  Copyright © 2018 CamilKaram. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class RxTableViewController: UITableViewController {
    
    let disposeBag = DisposeBag()
    
    lazy var viewModel : TableViewRxViewModel = {
        let viewModel = TableViewRxViewModel()
        return viewModel
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = nil
        tableView.estimatedRowHeight = 80
        viewModel.cars.bind(to: tableView.rx.items(cellIdentifier: "RxCarCell", cellType: RxCarCell.self)) { (index, carViewModel: TableViewCellRxViewModel, cell) in
            cell.carViewModel = carViewModel
            }.disposed(by: disposeBag)
    }
}
