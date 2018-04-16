//
//  RxCarViewModel.swift
//  MVVM
//
//  Created by camil karam on 3/30/18.
//  Copyright © 2018 CamilKaram. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class TableViewCellRxViewModel : NSObject{
    
    private let disposeBag = DisposeBag()
    private let car: RxCar
    static let horsepowerPerKilowatt = 1.34102209
    
    var modelText: BehaviorSubject<String>
    var manufacturerText: BehaviorSubject<String>
    var horsepowerText: BehaviorSubject<String>
    var kilowattText: BehaviorSubject<String>
    var titleText: BehaviorSubject<String>
    var photoURL: BehaviorSubject<URL>
    
    init(car: RxCar) {
        self.car = car
        //binding
        modelText = BehaviorSubject<String>(value: car.model)
        modelText.subscribe(onNext: { (model) in
            car.model = model
        }).disposed(by: disposeBag)
        
        manufacturerText = BehaviorSubject<String>(value: car.manufacturer)
        manufacturerText.subscribe(onNext: { (manufacturer) in
            car.manufacturer = manufacturer
        }).disposed(by: disposeBag)
        
        titleText = BehaviorSubject<String>(value: "\(car.manufacturer) \(car.model)")
        Observable.combineLatest(manufacturerText.asObservable(), modelText.asObservable()){
            return $0 + $1
            }.bind(to: titleText).disposed(by: disposeBag)
        
        
        horsepowerText = BehaviorSubject(value: "0")
        kilowattText = BehaviorSubject(value: String(car.kilowatts))
        kilowattText.map({ (kilowatts) -> String in
            let kw = Int(kilowatts) ?? 0
            let horsepower = max(Int(round(Double(kw) * CarViewModel.horsepowerPerKilowatt)), 0)
            return "\(horsepower) HP"
        }).bind(to: horsepowerText).disposed(by: disposeBag)
        
        
        photoURL = BehaviorSubject<URL>(value: URL(string: car.photoURL)!)
        
    }
}
