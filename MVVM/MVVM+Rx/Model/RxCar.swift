//
//  Car.swift
//  MVVM
//
//  Created by camil karam on 3/20/18.
//  Copyright © 2018 CamilKaram. All rights reserved.
//

import Foundation

class RxCar {
  var model: String
  var manufacturer: String
  var kilowatts: Int
  var photoURL: String
  
  init(model: String, manufacturer: String, kilowatts: Int, photoURL: String) {
    self.model = model
    self.manufacturer = manufacturer
    self.kilowatts = kilowatts
    self.photoURL = photoURL
  }
}


