//
//  HomePage.swift
//  SwiftPractic
//
//  Created by hiro on 2018. 6. 18..
//  Copyright © 2018년 hiro. All rights reserved.
//

import UIKit
import Foundation


struct HomePage {
    var productName = "a"
    var description = "dds"
    var image: UIImage
    
    static var pages = [
        HomePage(productName: "iPhone8", description: "Fast and Good", image:#imageLiteral(resourceName: "photo-1419041082630-1e98debd0a6a")),
        HomePage(productName: "iPhone7", description: "FastSS", image:#imageLiteral(resourceName: "photo-1437147921639-ef00e030265a")),
        HomePage(productName: "iPhone6", description: "Fast Tern", image:#imageLiteral(resourceName: "316f8e75"))
    ]
    
}
