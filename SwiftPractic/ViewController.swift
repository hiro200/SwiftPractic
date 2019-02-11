//
//  ViewController.swift
//  SwiftPractic
//
//  Created by hiro on 2018. 1. 21..
//  Copyright © 2018년 hiro. All rights reserved.
//
import SwiftyJSON
import Alamofire
import Kingfisher
import UIKit

class ViewController: UIPageViewController, UIPageViewControllerDataSource {
    

    lazy var viewControllerLists: [UIViewController] = {
        
        let sb = UIStoryboard(name: "Main" , bundle: nil)
        
        let vc1 = sb.instantiateViewController(withIdentifier: "a")
        let vc2 = sb.instantiateViewController(withIdentifier: "b")
        let vc3 = sb.instantiateViewController(withIdentifier: "c")
        let vc4 = sb.instantiateViewController(withIdentifier: "d")
       
        
        return [vc1, vc2, vc3, vc4]
        
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura", size: 40)
        return label
    }()
    
    lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    lazy var stackView = UIStackView(arrangedSubviews: [self.titleLabel, self.bodyLabel])
    lazy var content: [(title: String, description: String)] = [
        ("Welcome to Gratitudine", "Your everyday personal gratitude journal" ),
        ("Customize your own journal book", "Tired of looking at the same background everyday? Try our custom themes that match your mood everyday!🌈"),
        ("Safty is important", "Now you can set up a password or using touchID to make your journal private 🔐"),
        ("Have questions?","We are here to help! 🙋‍♂️🙋 In the meantime we welcome all the suggestion that will make Gratitudine better."),
        ("We are grateful", "Thanks so much for downloading our app and giving us a try. Make sure to leave us a good review in the AppStore!❤️")
    ]
    
    private var currentPage = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dd = GameData()
        dd.dis = 0
        
        
        var tt = 0
        tt = dd.Sum(3, 5)
        print("\(tt)")
        
        var ddt:String
        ddt = "wer"
        print(ddt)
        
  ///////////////////////////////
  ///////Array///////////////
        var arr:[Int] = []
        
        for i in 0..<100 {
            arr.append(i)
          //  print(arr[i])  //true
        }
        
        for str in arr {
            print("Number \(str).")
        }
       
///////////////////////////////////////////////////
///////////////////////////////////////////////////
//////Dictionary
        var dic: [String:String] = [:]
        
        for i in 0..<10{
            dic["acc\(i)"] = "dddt\(i)"
        }
        print(dic["acc0"]!)
        
        
        var responseMessages = [200: "OK",
                                403: "Access forbidden",
                                404: "File not found",
                                500: "Internal server error"]
        
        print(responseMessages[200] ?? "A")
        
        
        responseMessages[301] = "Moved permanently"
        print(responseMessages[301] ?? "A")
        
        
        responseMessages[404] = "Not found"
        responseMessages[500] = nil
        print(responseMessages)
        
        
        var interestingNumbers = ["primes": [2, 3, 5, 7, 11, 13, 15],
                                  "triangular": [1, 3, 6, 10, 15, 21, 28],
                                  "hexagonal": [1, 6, 15, 28, 45, 66, 91]]
        for key in interestingNumbers.keys {
            interestingNumbers[key]?.sort(by: <)
        }
        
        print(interestingNumbers["primes"]!)
        
        let imagePaths = ["star": "/glyphs/star.png",
                          "portrait": "/images/content/portrait.jpg",
                          "spacer": "/images/shared/spacer.gif"]
        
        for (name, path) in imagePaths {
            print("The path to '\(name)' is '\(path)'.")
        }
        
        
        let glyphIndex = imagePaths.index { $0.value.hasPrefix("/glyphs") }
        if let index = glyphIndex {
            print("The '\(imagePaths[index].key)' image is a glyph.")
        } else {
            print("No glyphs found!")
        }
        // Prints "The 'star' image is a glyph.")
        
        
        print(imagePaths[glyphIndex!])
        // Prints "("star", "/glyphs/star.png")"
////////////////////////////////////
////////////////////////////////////
////////////  Set ////
        let ingredients: Set = [2,8,10]
        if ingredients.contains(8) {
            print("No thanks, too sweet.")
        }
/////////////////////////////////////////////
/////////////////////////////////////////////
/////////////// Json
        let json = JSON(["metadata":["responseInfo":["status":200,"developerMessage":"Best Result"]]])
        
        
        if json["metadata"]["responseInfo"]["status"].intValue == 200 {
            // we're OK to parse!
            print("\(String(describing: json["metadata"]["responseInfo"]["developerMessage"].string!))")
        }
        
        let para = ["id": "bar", "name": "hioop"]
        
        
        Alamofire.request("https://hirohongu.cafe24.com/googlelogin.php", method: .post, parameters: para, encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                if response.result.value != nil{
                    print("Good!!!")
                }
                break
                
            case .failure(_):
                print(response.result.error!)
                break
                
            }
        }
        
//////////////////////////////////////////////////////
//////////////////////////////////////////////////////
//////////////// Kingfisher /////
        let imageView = UIImageView()
        
        let url = URL(string: "https://hirohongu.cafe24.com/boom.png")!
        imageView.kf.setImage(with: url)
        
        
//////////////////////////////////////////////
//////////////////////////////////////////////
        
        // Do any additional setup after loading the view.
        self.dataSource = self
        setupGestures()
        setupLabels(withPage: currentPage)
        if let firstViewController = viewControllerLists.first {
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerLists.index(of: viewController) else {return nil}
        setupLabels(withPage: currentPage)
        let previousIndex = vcIndex - 1
        guard previousIndex >= 0 else {return nil}
        guard viewControllerLists.count > previousIndex else {return nil}
        return viewControllerLists[previousIndex]
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerLists.index(of: viewController) else {return nil}
        setupLabels(withPage: currentPage)
        let nextIndex = vcIndex + 1
        guard viewControllerLists.count != nextIndex else {return nil}
        guard viewControllerLists.count > nextIndex else {return nil}
        return viewControllerLists[nextIndex]
    }
    
    
    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.gray
        appearance.currentPageIndicatorTintColor = UIColor.white
        appearance.backgroundColor = UIColor.darkGray
    }
    
    fileprivate func setupLabels(withPage page: Int){
        let appearance = UIPageControl.appearance()
        appearance.currentPage = page
        titleLabel.text = content[page].title
        bodyLabel.text = content[page].description
        titleLabel.numberOfLines = 0
        bodyLabel.numberOfLines = 0
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        if !stackView.isDescendant(of: view){
            view.addSubview(stackView)
        }
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -120).isActive = true
        self.view.layoutIfNeeded()
        
    }
    func setupGestures(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapAnimations))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc fileprivate func handleTapAnimations(){
        //first animation
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.titleLabel.alpha = 0.8
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.titleLabel.alpha = 0
                self.titleLabel.transform = CGAffineTransform(translationX: 0, y: -550)
            }, completion: nil)
        }
        //second animation
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.bodyLabel.alpha = 0.8
            self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.bodyLabel.alpha = 0
                self.bodyLabel.transform = CGAffineTransform(translationX: 0, y: -550)
            }, completion: { _ in
                self.stackView.removeFromSuperview()
                self.titleLabel.alpha = 1
                self.titleLabel.transform = .identity
                self.bodyLabel.alpha = 1
                self.bodyLabel.transform = .identity
                self.currentPage += 1
                //                if self.currentPage < self.content.count {
                //                    self.setupLabels(withPage: self.currentPage)
                //                }
            })
        }
        
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        setupPageControl()
        return self.viewControllerLists.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    
}

