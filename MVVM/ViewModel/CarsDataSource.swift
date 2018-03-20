//
//  CarsDatasource.swift
//  MVVM
//
//  Created by camil karam on 3/20/18.
//  Copyright © 2018 CamilKaram. All rights reserved.
//

import Foundation
import UIKit

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}
class CarsDataSource : GenericDataSource<CarViewModel>, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath) as! CarCell
        cell.carViewModel = self.data.value[indexPath.row]
        return cell
    }
}
