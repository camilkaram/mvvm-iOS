//
//  CarCell.swift
//  MVVM
//
//  Created by camil karam on 3/19/18.
//  Copyright © 2018 CamilKaram. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import SDWebImage

open class RxCarCell: UITableViewCell
{
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var carNameLabel: UILabel!
    @IBOutlet weak var carDescriptionLabel: UILabel!
    
    let disposeBag = DisposeBag()
    
    var carViewModel : TableViewCellRxViewModel? {
        didSet {
            
            guard let carViewModel = carViewModel else {
                return
            }
            
            carViewModel.titleText.bind(to: carNameLabel.rx.text).disposed(by: self.disposeBag)
            carViewModel.horsepowerText.bind(to: carDescriptionLabel.rx.text).disposed(by: self.disposeBag)
            carViewModel.photoURL.bind(to: carImageView.rx.imageURL(withPlaceholder: UIImage(named: "car-placeholder"), options: [SDWebImageOptions.scaleDownLargeImages,SDWebImageOptions.allowInvalidSSLCertificates])).disposed(by: self.disposeBag)
        }
    }
}
