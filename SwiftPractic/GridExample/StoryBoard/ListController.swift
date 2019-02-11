//
//  GridController.swift
//  SwiftPractic
//
//  Created by hiro on 2018. 6. 20..
//  Copyright © 2018년 hiro. All rights reserved.
//

import UIKit
import Foundation
import Hero
import SwiftyJSON
import Alamofire

class ListCell: UITableViewCell  {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
       
        
        imageView?.frame.origin.x = 0
        imageView?.frame.size = CGSize(width: bounds.height, height: bounds.height)
        textLabel?.frame.origin.x = bounds.height + 10
        detailTextLabel?.frame.origin.x = bounds.height + 10
    }
    
}



class ListController: UITableViewController {
    
    /** TableView 관련 Swipe Refresh 이벤트 **/
    
    
    var name: String = ""
    var detail: String = ""
    
    override func loadView() {
        super.loadView()
        
        GameData.goData()
        
        print(GameData.varDatas.count)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // set up the refresh control
        refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: "Pull to refresh")
        //Swift3에서부터는 action사용 시 #selector가 필요.//
        refreshControl?.addTarget(self, action: #selector(self.refresh(_:)), for: UIControlEvents.valueChanged)
        
        tableView.addSubview(refreshControl!) //리플래시 화면을 보일(빙글빙글 돌아가는 프로그래스바)뷰를 장착.//
        
        ////////////////////////////////
        ////////////////////////////////
    }
    
    
    
    //당겨서 새로고침//
    @objc func refresh(_ sender:AnyObject) {
        // Code to refresh table view
        print("refresh table")
        
        tableView.reloadData() //뷰를 재로드//
        
        refreshControl?.endRefreshing() //다시 새로고침을 끝낸다.//
       
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ImageLibrary.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
        
        if indexPath.item < GameData.varDatas.count  {
            self.name = GameData.varDatas[indexPath.item]["name"].stringValue
            self.detail = GameData.varDatas[indexPath.item]["detail"].stringValue
        }else{
            self.name = "Hyunho"
            self.detail = "Programer"
        }
        
        print(self.name)
        print(self.detail)
    
        
        
        cell.hero.modifiers = [.fade, .translate(x:-100)]
        cell.imageView!.hero.id = "image_\(indexPath.item)"
        cell.imageView!.hero.modifiers = [.arc]
        cell.imageView!.image = ImageLibrary.thumbnail(index:indexPath.item)
        cell.imageView!.isOpaque = true
        
        cell.textLabel!.text = self.name
        cell.detailTextLabel!.text = self.detail
        
       // cell.textLabel!.text = "Item \(indexPath.item)"
       // cell.detailTextLabel!.text = "Detail \(indexPath.item)"
        
        return cell
    }
    
    
  
    
    /*
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52   //cell  의 높이
    }
    */
    
    
    //table Click 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = (GameData.viewController(forStoryboardName: "ImageViewer") as? ImageViewController)!
        vc.selectedIndex = indexPath
        //hero.replaceViewController(with: vc )
        //StoryBoard 전환
        navigationController!.pushViewController(vc, animated: true)
    }
    
    
    @objc func showImage() {
        //StoryBoard 전환
        hero.replaceViewController(with: (GameData.viewController(forStoryboardName: "ImageViewer") as? ImageViewController)! )
    }
    
}



