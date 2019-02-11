//
//  GridCell.swift
//  SwiftPractic
//
//  Created by hiro on 2018. 6. 21..
//  Copyright © 2018년 hiro. All rights reserved.
//

import UIKit
import Hero
import ChameleonFramework

class GridImageCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var detailTextLabel: UILabel!
}


class GridController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageLibrary.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as? GridImageCell)!
        
        let image = ImageLibrary.thumbnail(index:indexPath.item)
        cell.hero.modifiers = [.fade, .translate(y:20)]
        cell.imageView!.image = image
        cell.imageView!.hero.id = "image_\(indexPath.item)"
        cell.imageView!.hero.modifiers = [.arc]
        cell.imageView!.isOpaque = true
        cell.textLabel!.text = "Item \(indexPath.item)"
        cell.detailTextLabel!.text = "Description \(indexPath.item)"
        cell.backgroundColor = UIColor(averageColorFrom: image)
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = (GameData.viewController(forStoryboardName: "ImageViewer") as? ImageViewController)!
        vc.selectedIndex = indexPath
        
        navigationController!.pushViewController(vc, animated: true)
    }
    
    
}



