//
//  Car.swift
//  MVVM
//
//  Created by Jure Zove on 01/05/16.
//  Copyright © 2016 Jure Zove. All rights reserved.
//

import Foundation

class Car {
  var model: String
  var make: String
  var kilowatts: Int
  var photoURL: String
  
  init(model: String, make: String, kilowatts: Int, photoURL: String) {
    self.model = model
    self.make = make
    self.kilowatts = kilowatts
    self.photoURL = photoURL
  }
}


