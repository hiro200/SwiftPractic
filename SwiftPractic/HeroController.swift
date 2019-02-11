//
//  HeroController.swift
//  SwiftPractic
//
//  Created by hiro on 2018. 6. 11..
//  Copyright © 2018년 hiro. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
//import Kingfisher
import UIKit
//import AlamofireObjectMapper
import ChameleonFramework
//import Hero


class HeroController:UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    //    @IBOutlet weak var SpringView: UIImageView!
    @IBOutlet weak var gotoStory: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let a = ImageLibrary.dis
        
    }
    
    @IBAction func Click(_ sender: Any) {
        goTo()
    }
    
    
    func goTo() {
        
        //let vc = viewController(forStoryboardName: "AppleHomePage")
        let vc = UIStoryboard(name: "Homepage", bundle: nil).instantiateInitialViewController()!
        
        
        // iOS bug: https://github.com/lkzhao/Hero/issues/106 https://github.com/lkzhao/Hero/issues/79
        
        DispatchQueue.main.async {
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    @objc func showLegacy() {
        //StoryBoard 전환
        hero.replaceViewController(with: viewController(forStoryboardName: "Main"))
    }
    
    
    func viewController(forStoryboardName: String) -> UIViewController {
        return UIStoryboard(name: forStoryboardName, bundle: nil).instantiateInitialViewController()!
    }
        
}
