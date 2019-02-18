//
//  Common.swift
//  SwiftPractic
//
//  Created by hiro on 2018. 4. 17..
//  Copyright © 2018년 hiro. All rights reserved.
//

import UIKit
import Foundation
import ObjectMapper
import SwiftyJSON
import Alamofire


/*  Json 예제

{
    "err": 0,
    "result": [{
    "id": 71930,
    "account_id": 40869,
    "status": "enabled",
    "settings_data": {
    "time_format": "12h",
    "timezone": "US/Pacific",
    "fingerprint_versions": {
    "browser.browser-js": 1
    },
    "integrations": {
    "jira": {},
    "datadog": {},
    "bitbucket": {},
    "github": {},
    "trello": {
    "board_id": "xxx",
    "enabled": true,
    "access_token_user_id": 1234,
    "list_id": "xxxxx"
    },
    "slack": {
    "channel_id": "xxxx",
    "enabled": true,
    "access_token_user_id": "xx"
    },
    "webhook": {},
    "victorops": {},
    "asana": {},
    "pivotal": {},
    "campfire": {},
    "sprintly": {},
    "pagerduty": {},
    "hipchat": {},
    "email": {
    "enabled": true
    },
    "flowdock": {}
    }
    },
    "date_created": 1468068105,
    "date_modified": 1493409629,
    "name": "Android_ParentApp"
    }, {
    "id": 71931,
    "account_id": 40869,
    "status": "enabled",
    "settings_data": {
    "time_format": "12h",
    "timezone": "US/Pacific",
    "fingerprint_versions": {
    "browser.browser-js": 1
    },
    "integrations": {
    "jira": {},
    "datadog": {},
    "bitbucket": {},
    "github": {},
    "trello": {
    "board_id": "xxxx",
    "enabled": true,
    "access_token_user_id": 1234,
    "list_id": "xxxxx"
    },
    "slack": {
    "channel_id": "xxxxx",
    "enabled": true,
    "access_token_user_id": "xxx"
    },
    "webhook": {},
    "victorops": {},
    "asana": {},
    "pivotal": {},
    "campfire": {},
    "sprintly": {},
    "pagerduty": {},
    "hipchat": {},
    "email": {
    "enabled": true
    },
    "flowdock": {}
    }
    },
    "date_created": 1468068142,
    "date_modified": 1493409658,
    "name": "Android_TeacherApp"
    }]
}

 */

class User : Mappable {
    
    var id: Int?
    var name: String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
    
    
}



func fetchData(){
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    let apiUrl = "https://raw.githubusercontent.com/javalnanda/AlamofireObjectMapperSample/master/AOMsample.json"
    Alamofire.request(apiUrl).responseArray(keyPath: "result") { (response: DataResponse<[User]>)  in
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        switch response.result {
        
        case .success:
            let projects = response.result.value ?? []
            for project in projects {
                print(project.name as Any)
            }
            break
        case .failure(let error):
            print(error)
            break
        }
      }
    
}



class WeatherResponse: Mappable {
    var location: String?
    var threeDayForecast: [Forecast]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        location <- map["location"]
        threeDayForecast <- map["three_day_forecast"]
    }
}

class Forecast: Mappable {
    var day: String?
    var temperature: Int?
    var conditions: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        day <- map["day"]
        temperature <- map["temperature"]
        conditions <- map["conditions"]
    }
}


class GameData {
    static var varDatas: JSON = JSON.null
    static var dis = 13
    static var sub = 7
    static var str = "retion"

    init() {
        GameData.goData()
    }
    
    
    static func Sum(_ a:Int,_ b:Int)->Int {
        var result = 0
        result = a+b
        
        return result
    }
    
    static func viewController(forStoryboardName: String) -> UIViewController {
        return UIStoryboard(name: forStoryboardName, bundle: nil).instantiateInitialViewController()!
    }
    
    static func goData() {
        
        let para = ["item":0]
        
        Alamofire.request("https://hirohongu.cafe24.com/swifJson.php", method: .post, parameters: para, encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                if response.result.value != nil{
                    
                    GameData.varDatas = JSON(response.result.value!)
                    
                    print("Good!!!")
                }
                break
                
            case .failure(_):
                print(response.result.error!)
                break
                
            }
        }
    }
    
    
}



class ImageLibrary: GameData {
    
    
    static var count = 100
    static func thumbnail(index: Int) -> UIImage {
        return UIImage(named: "Unsplash\(index % 11)_thumb")!
    }
    static func image(index: Int) -> UIImage {
        return UIImage(named: "Unsplash\(index % 11)")!
    }
    
    
}

