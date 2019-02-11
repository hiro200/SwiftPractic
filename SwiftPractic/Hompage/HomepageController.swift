//
//  HomepageController.swift
//  SwiftPractic
//
//  Created by hiro on 2018. 6. 18..
//  Copyright © 2018년 hiro. All rights reserved.
//


import UIKit
import Foundation


class HomepageController:UIViewController {
    var selectedIndex: IndexPath!
    var pages: [HomePage] = HomePage.pages
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
     
      
    }
    
    
    
}


extension HomepageController:UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as? HomePageCell)!
        cell.homepage =  pages[indexPath.item]
        
        return cell
    }
    
}
