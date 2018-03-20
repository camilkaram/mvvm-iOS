//
//  CarViewModel.swift
//  MVVM
//
//  Created by camil karam on 3/19/18.
//  Copyright © 2018 CamilKaram. All rights reserved.
//

import Foundation
class CarViewModel : NSObject {
    private var car: Car
    static let horsepowerPerKilowatt = 1.34102209
    
    var modelText: String {
        return car.model
    }
    
    var makeText: String {
        return car.make
    }
    
    var horsepowerText: String {
        let horsepower = Int(round(Double(car.kilowatts) * CarViewModel.horsepowerPerKilowatt))
        return "\(horsepower) HP"
    }
    
    var titleText: String {
        return "\(car.make) \(car.model)"
    }
    
    var photoURL: URL? {
        return URL(string: car.photoURL)
    }
    
    init(car: Car) {
        self.car = car
    }
}
