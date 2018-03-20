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
    
    var carViewModel : CarViewModel? {
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
        }
    }
}
