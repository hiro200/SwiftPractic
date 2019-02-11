//
//  ImageViewController.swift
//  SwiftPractic
//
//  Created by hiro on 2018. 6. 25..
//  Copyright © 2018년 hiro. All rights reserved.
//

import UIKit

class ScrollingImageCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
}



class ImageViewController: UICollectionViewController {
    
    
    var collection: UICollectionView!
    var selectedIndex: IndexPath?
    var check:Bool?

    override func viewDidLoad() {
        super.viewDidLoad()
        check = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageLibrary.count
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:ScrollingImageCell?
        var temp:Int = indexPath.item
        
        
        
        if check == true {
            check = false
            cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: selectedIndex!) as? ScrollingImageCell)!
            cell!.imageView.image = ImageLibrary.image(index:selectedIndex!.item)
            cell!.imageView.hero.id = "image_\(selectedIndex!.item)"
            temp = selectedIndex!.item + 1
        }else{
            cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as? ScrollingImageCell)!
            cell!.imageView.image = ImageLibrary.image(index:temp)
            cell!.imageView.hero.id = "image_\(temp)"
        }
        
        

        
        
        return cell!
    }
    
}


extension ImageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return view.bounds.size
    }
}
