//
//  HomePageCell.swift
//  SwiftPractic
//
//  Created by hiro on 2018. 6. 18..
//  Copyright © 2018년 hiro. All rights reserved.
//

import UIKit
import Foundation

class  HomePageCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var spec: UILabel!
    
    
    var homepage: HomePage? {
        
        didSet {
            guard let homepage = homepage else { return }
             imageView.image = homepage.image
            name.text = homepage.productName
            spec.text = homepage.description
        }
        
    }
}
