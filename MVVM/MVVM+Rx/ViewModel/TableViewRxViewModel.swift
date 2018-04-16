//
//  CarsViewModel.swift
//  MVVM
//
//  Created by camil karam on 3/20/18.
//  Copyright © 2018 CamilKaram. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class TableViewRxViewModel : NSObject{
    private let disposeBag = DisposeBag()
    var cars: BehaviorSubject<[TableViewCellRxViewModel]>
    
    override init() {
        let carsM: [TableViewCellRxViewModel] = {
            let ferrariF12 = RxCar(model: "F12", manufacturer: "Ferrari", kilowatts: 544, photoURL: "https://auto.ferrari.com/en_EN/wp-content/uploads/sites/5/2013/07/Ferrari-F12berlinetta.jpg")
            let zondaF = RxCar(model: "Zonda F", manufacturer: "Pagani", kilowatts: 449, photoURL: "https://cdn.luxatic.com/wp-content/uploads/2012/11/Rare-Pagani-Zonda-C12-1.jpg")
            let lamboAventador = RxCar(model: "Aventador", manufacturer: "Lamborghini", kilowatts: 522, photoURL: "http://st.motortrend.com/uploads/sites/10/2015/09/2016-Lamborghini-Aventador-LP-750-4-Superveloce-front-three-quarter-in-motion-026.jpg")
            
            return [TableViewCellRxViewModel(car: ferrariF12), TableViewCellRxViewModel(car: zondaF), TableViewCellRxViewModel(car: lamboAventador)]
        }()
        cars = BehaviorSubject<[TableViewCellRxViewModel]>(value: carsM)
    }
}
