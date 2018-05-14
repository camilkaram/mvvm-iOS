//
//  CarViewModel.swift
//  MVVM
//
//  Created by camil karam on 3/19/18.
//  Copyright © 2018 CamilKaram. All rights reserved.
//

import Foundation
class TableViewCellViewModel : NSObject {
    private var car: Car
    static let horsepowerPerKilowatt = 1.34102209
    var rpm = DynamicValue<Double>(0.0)
    
    var modelText: String {
        return car.model
    }
    
    var makeText: String {
        return car.manufacturer
    }
    
    var horsepowerText: String {
        let horsepower = Int(round(Double(car.kilowatts) * TableViewCellRxViewModel.horsepowerPerKilowatt))
        return "\(horsepower) HP"
    }
    
    var rpmText: String {
        return"\(rpm.value) rpm"
    }
    
    var torqueText: String {
        if self.rpm.value > 0.0
        {
            let horsepower = Int(round(Double(car.kilowatts) * TableViewCellViewModel.horsepowerPerKilowatt))
            let torque = Double(horsepower * 5252) / rpm.value
            return "\(torque) lb/ft (\(torque * 1.35582) Nm)"
        }else{
            return "N/A"
        }
    }
    
    var titleText: String {
        return "\(car.manufacturer) \(car.model)"
    }
    
    var photoURL: URL? {
        return URL(string: car.photoURL)
    }
    
    init(car: Car) {
        self.car = car
    }
    
    func setRpm(rpm : Double)
    {
        self.rpm.value = rpm
    }
}
