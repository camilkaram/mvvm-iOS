//
//  CurrencyViewModel.swift
//  TemplateProject
//
//  Created by Benoit PASQUIER on 13/01/2018.
//  Copyright © 2018 Benoit PASQUIER. All rights reserved.
//

import Foundation

class CarsViewModel : NSObject{
    
    weak var dataSource : GenericDataSource<CarViewModel>?
    
    init(dataSource : GenericDataSource<CarViewModel>?) {
        self.dataSource = dataSource
    }
    
    func fetchCars() {
        // Here We should call the service layer to get the related Data. To keep the example simple I just harcoded The model.
        let cars: [CarViewModel] = {
            let ferrariF12 = Car(model: "F12", make: "Ferrari", kilowatts: 544, photoURL: "https://auto.ferrari.com/en_EN/wp-content/uploads/sites/5/2013/07/Ferrari-F12berlinetta.jpg")
            let zondaF = Car(model: "Zonda F", make: "Pagani", kilowatts: 449, photoURL: "https://cdn.luxatic.com/wp-content/uploads/2012/11/Rare-Pagani-Zonda-C12-1.jpg")
            let lamboAventador = Car(model: "Aventador", make: "Lamborghini", kilowatts: 522, photoURL: "http://st.motortrend.com/uploads/sites/10/2015/09/2016-Lamborghini-Aventador-LP-750-4-Superveloce-front-three-quarter-in-motion-026.jpg")
            
            return [CarViewModel(car: ferrariF12), CarViewModel(car: zondaF), CarViewModel(car: lamboAventador)]
        }()
        self.dataSource?.data.value = cars
    }
}
