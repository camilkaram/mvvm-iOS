//
//  CarCell.swift
//  MVVM
//
//  Created by camil karam on 3/19/18.
//  Copyright © 2018 CamilKaram. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

open class CarCell: UITableViewCell
{
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var carNameLabel: UILabel!
    @IBOutlet weak var carDescriptionLabel: UILabel!
    
    var carViewModel : TableViewCellViewModel? {
        didSet {
            
            guard let carViewModel = carViewModel else {
                return
            }
            carNameLabel.text = carViewModel.titleText
            carDescriptionLabel.text = carViewModel.horsepowerText
            if let url = carViewModel.photoURL
            {
                carImageView.sd_setImage(with: url as URL, placeholderImage: UIImage(named: "car-placeholder"), options: [SDWebImageOptions.scaleDownLargeImages,SDWebImageOptions.allowInvalidSSLCertificates], completed: nil)
            }
            //bind a field in the cell to the viewModel. Whever the value in the viewModel changes the field will be updated
            carViewModel.rpm.addAndNotify(observer: self, completionHandler: {
                print("RPM Changed. Calculated Torque for \(carViewModel.titleText) on \(carViewModel.rpmText) is \(carViewModel.torqueText)")
            })
            
            //change the rpm. this can be changed via UI component in each cell.
            carViewModel.setRpm(rpm: 4000)
        }
    }
}
