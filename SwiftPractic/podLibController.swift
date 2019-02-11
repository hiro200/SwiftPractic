//
//  podLibController.swift
//  SwiftPractic
//
//  Created by hiro on 2018. 5. 25..
//  Copyright © 2018년 hiro. All rights reserved.
//

import SwiftyJSON
import Alamofire
import Kingfisher
import UIKit
import AlamofireObjectMapper
import ChameleonFramework
import Foundation
import Hero
import AES256CBC

struct Caches {
    var loadcount:Int
    var cache = String()
}


class podLibController:UIViewController {
    
    

    var randNum = 1 + arc4random_uniform(500)//1~500사이의 난수
    var dubleRand = drand48() //0~1.0 사이의 난수
    
    
    var anyArr1: [Any] = [1, "hi", true, 1.0]  // Int,String,Bool,float 모두 구조체
    var anyArr2: Array<Any> = [1, "hi", true, 1.0]
    
    
    var anyArrs: [AnyObject] = [1 as AnyObject, "hi" as AnyObject, true as AnyObject, 1.0 as AnyObject]
    var anyArrs2: [AnyObject] = [GameData()]  // class type만 사용 가능
    
    
    var Arr1 = [9, 20, 28, 18, 11]
    var Arr2 = [30, 1, 21, 17, 28]
    
    var Compare1 = [[Int]](repeating: Array(repeating: 0, count: 5), count: 5)
    //var Compare1 = Array(repeating: "", count: 5)
    //var Compare1 : [[Int]] = Array(repeating: Array(repeating: 1,count:5 ), count: 3)
    

    var Compare2 = [[Int]](repeating: Array(repeating: 0, count: 5), count: 5)
    var Str = [String](repeating: "", count: 5)
    
    
    func IntCompare(a:Array<Int>) -> Array<[Int]>{
        var result = [[Int]](repeating: [Int](repeating: 0, count: 5), count: 5)
        var temp = Array(repeating: 0, count: 5)
        
        temp = a
        
        for i in 0..<5 {
            for j in 0..<5 {
                if temp[i] > 0 {
                    result[i][j] = temp[i]%2
                    temp[i] /= 2
                    
                }
            }
            result[i] = result[i].reversed()
        }
    
        return result
    }
    
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
    
    //var a = 0 + arc4random_uniform(11)
    var result_num = 0
    var tempPoint = 0
    var dartPoint = [0,0,0]
    var num = -1
    var onenumCheck = 0
    
    func Total_Num(a:String)->Int {
        //var temp:[Character] = ["a"]
        
        num = -1
        
        for value in a {
        
            if value == "0" || value == "1" || value == "2" || value == "3" || value == "4" || value == "5" || value == "6" || value == "7" || value == "8" || value == "9" {
                if onenumCheck == 1   {
                    tempPoint = tempPoint*10
                }else{
                    
                    tempPoint = Int(String(value))!
                    onenumCheck = 1
                    num += 1
                }
                
            }else if value == "S"{
                tempPoint = Int(pow(Double(tempPoint), 1.0))
                dartPoint[num] = tempPoint
                onenumCheck = 0
                print("ffff-> \(tempPoint)")
            }else if value == "D"{
                tempPoint = Int(pow(Double(tempPoint), 2.0))
                dartPoint[num] = tempPoint
                onenumCheck = 0
            }else if value == "T"{
                tempPoint = Int(pow(Double(tempPoint), 3.0))
                dartPoint[num] = tempPoint
                onenumCheck = 0
            }else if value == "*"{
                dartPoint[num-1] *= 2
                 dartPoint[num] = tempPoint*2
            }else if value == "#"{
                dartPoint[num] = tempPoint*(-1)
            }else{
                dartPoint[num] = tempPoint
            }
            
            
        }
        
       
        result_num = dartPoint[0]+dartPoint[1]+dartPoint[2]
        
        return result_num
        
    }

//////////////////////////////////////////////////////
//////////////////////////////////////////////////////
    
    let cacheSize = 3
    let cityes = ["Jeju","Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]
    let cache_hit = 1
    let cache_miss = 5
    var cachsed = [Caches]()
    
    func CacheResult(a:Int, b:[String])-> Int {
        var timer = 0
        var i=0
        
        for city in b {
            for i in 0..<a {
            if cachsed[i].cache.contains(city) && cachsed.count < a {
                timer += cache_hit
                cachsed[i].loadcount += 1
            }else if !cachsed[i].cache.contains(city) && cachsed[i].cache.count < a {
                timer += cache_miss
                cachsed[i].cache.append(city)
            }else if !cachsed[i].cache.contains(city) && cachsed[i].cache.count > a {
                
            }
            }
            
        }
        
        var resultValue = 0
        
        return 0
    }
    
    @IBOutlet weak var imageView: UIImageView!
//    @IBOutlet weak var SpringView: UIImageView!
    
    @IBAction func Click(_ sender: UIButton) {
        let vc = UIStoryboard(name: "ListGrid", bundle: nil).instantiateInitialViewController()!
        
        
        // iOS bug: https://github.com/lkzhao/Hero/issues/106 https://github.com/lkzhao/Hero/issues/79
        
        DispatchQueue.main.async {
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = RandomFlatColor()
        view.backgroundColor = GradientColor(gradientStyle: UIGradientStyle.leftToRight, frame: CGRect(x: 0, y: 0, width: 200, height: 200), colors: [FlatGreen()])

        
        
        GameData.goData()  ////클래스 선언
        ////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////
        
        let romeoAndJuliet = [
            "Act 1 Scene 1: Verona, A public place",
            "Act 1 Scene 2: Capulet's mansion",
            "Act 1 Scene 3: A room in Capulet's mansion",
            "Act 1 Scene 4: A street outside Capulet's mansion",
            "Act 1 Scene 5: The Great Hall in Capulet's mansion",
            "Act 2 Scene 1: Outside Capulet's mansion",
            "Act 2 Scene 2: Capulet's orchard",
            "Act 2 Scene 3: Outside Friar Lawrence's cell",
            "Act 2 Scene 4: A street in Verona",
            "Act 2 Scene 5: Capulet's mansion",
            "Act 2 Scene 6: Friar Lawrence's cell"
        ]
        
        var act1SceneCount = 0
        
        for scene in romeoAndJuliet {
            if scene.hasPrefix("Act 1 ") {
                act1SceneCount += 1
            }
        }
        print("There are \(act1SceneCount) scenes in Act 1")
        // Prints "There are 5 scenes in Act 1"
        
////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
        
        
        let str = "Hellow World"
        var index = str.index(str.startIndex, offsetBy:4) // 문자의 중간 글자 찾음
        var charac = str[index]
        
        
        let score = "1T2D3D#"
        let score1 = "1D2S#10S"
        let score2 = "1D2S0T"
        
        let Sums = Total_Num(a:score)
        let Sums1 = Total_Num(a:score1)
        let Sums2 = Total_Num(a:score2)
        print(Sums)
        print(Sums1)
        print(Sums2)
        
        Compare1 = IntCompare(a: Arr1)
        Compare2 = IntCompare(a: Arr2)
        print(Compare1)
        
        for i in 0..<5 {
            for j in 0..<5 {
                if(Compare1[i][j] == 1 || Compare2[i][j] == 1){
                    Str[i] += "#"
                }else{
                    Str[i] += " "
                }
            }
        }
        
         print(Str)
        
       
        
       // let dd = GameData()   //static 이 없을때
        GameData.dis = 0
        
        
        var tt = 0
        tt = GameData.Sum(3, 5)
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
        
        
        ////Data to String and Sting to Data
        
        var testString = "This is a test string"
        var somedata = testString.data(using: String.Encoding.utf8)
        var backToString = String(data: somedata!, encoding: String.Encoding.utf8) as String!
        
        /////////////////////////////////////////////
        /////////////////////////////////////////////
        /////////////// Json
        let json = JSON(["metadata":["responseInfo":["status":200,"developerMessage":"Best Result"]]])
        
        
        if json["metadata"]["responseInfo"]["status"].intValue == 200 {
            // we're OK to parse!
            print("\(String(describing: json["metadata"]["responseInfo"]["developerMessage"].string!))")
        }
        
       
        
        let para = ["id":"aaaar","name":"sssioop"]
        
        
        //let password = AES256CBC.generatePassword()  // returns random 32 char string
        
        let password = "djhfkshf=!jfhhkufhkf=jfdkjdkjjkl"
        
        // get AES-256 CBC encrypted string
        let encrypted_id:String? = AES256CBC.encryptString("kariosrt", password: password)
        let encrypted_name:String? = AES256CBC.encryptString("jojome", password: password)
        
        print("Encrypted ==> \(encrypted_id!)")
        
        let temp = ["id":"\(encrypted_id!)","name":"\(encrypted_name!)","message":["result":"nice meetyou"]] as [String : Any]
        
        //var sem = JSON(temp)
        
        //print(sem["message"]["result"].stringValue)
        
        // decrypt AES-256 CBC encrypted string
       // let decrypted = AES256CBC.decryptString(encrypted!, password: password)
        
      //  print("Decrypted ==> \(decrypted)")
        
        Alamofire.request("https://www.revohooah.de/AWSdata.php", method: .post, parameters: temp, encoding: JSONEncoding.default)
            .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                print("Progress: \(progress.fractionCompleted)")
            }
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    //let data = response.result.value
                    
                    let jsonData = JSON(data)
                    
                    
                    let decrypted_id = AES256CBC.decryptString((jsonData["id"].stringValue), password: password)
                    
                    print("DecrypId ==> \(decrypted_id!)")
                    print("Message ==> \(jsonData["message"]["result"].stringValue)")
                    
                    print("Good Job")
                    print("DataStr==> \(data)")
                    
                    //let user = User(data :JSONString)
                    
                    //print(user?.id ?? "a")
                    
                    break
                case .failure:
                    print("Fail")
                    break
                }
                
                debugPrint(response)
            }
        
        /*
            .responseString { response in
                switch(response.result) {
                case .success(let strs):
            
                      print("Strings==> \(strs)")
                      
                     // let user = User(JSONString: strs)
                      
                     // print(user?.id ?? "a")
                      
                      let sder = JSON(strs)
                      
                      print("ID = \(sder["id"].stringValue)")
                      
                    /*
                        let decrypted_id = AES256CBC.decryptString((jsonData["id"].string!), password: password)
                        
                        print("DecrypId ==> \(decrypted_id!)")
                        
                        */
                    
                    
                        //print(data)
                    
                    break
                case .failure(_):
                    print("Error message:\(response.result.error)")
                    break
                }
 
                debugPrint(response)
         
        }
        */
        
        
        
        /*
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
        */
        
        
        
        //////////////////////////////////////////////////////
        //////////////////////////////////////////////////////
        //////////////// Kingfisher ///////웹상의 이미지를 보여줌
        
        //let image = UIImage(named: "exp6.png")
        let url = URL(string: "https://hirohongu.cafe24.com/boom.png")
        imageView.kf.indicatorType = .activity  //빙글 돌아가는 indicator
        imageView.kf.setImage(with: url)
        //imageView.kf.setImage(with: url,placeholder: image)
        
        
        imageView.kf.setImage(with: url, completionHandler: {
            (image, error, cacheType, imageUrl) in
            // image: Image? `nil` means failed
            // error: NSError? non-`nil` means failed
            // cacheType: CacheType
            //                  .none - Just downloaded
            //                  .memory - Got from memory cache
            //                  .disk - Got from disk cache
            // imageUrl: URL of the image
            
        })
        
        
        
        //imageView.hero.modifiers = [.translate(y:100)]
        
        /*
       // Use your own GIF file or any image as the indicator image while downloading
        
        let p = Bundle.main.path(forResource: "loader", ofType: "gif")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: p))
        
        imageView.kf.indicatorType = .image(imageData: data)
        
        imageView.kf.setImage(with: url)
       
        
        
        //Customize the indicator with any view you want
        
        struct MyIndicator: Indicator {
            let view: UIView = UIView()
            
            func startAnimatingView() { view.isHidden = false }
            func stopAnimatingView() { view.isHidden = true }
            
            init() {
                view.backgroundColor = .red
            }
        }
        
        let i = MyIndicator()
        imageView.kf.indicatorType = .custom(indicator: i)
        
        
        //Or update your own indicator UI with progress block
        
        imageView.kf.setImage(with: url, progressBlock: {
            receivedSize, totalSize in
            let percentage = (Float(receivedSize) / Float(totalSize)) * 100.0
            print("downloading progress: \(percentage)%")
            myIndicator.percentage = percentage
        })
        
        
        //Add a fade transition when setting image after downloaded
        imageView.kf.setImage(with: url, options: [.transition(.fade(0.2))])
        
        //Transform downloaded image to round corner before displaying and caching
        let processor = RoundCornerImageProcessor(cornerRadius: 20)
        imageView.kf.setImage(with: url, placeholder: nil, options: [.processor(processor)])
        
        */
        
        //////////////////////////////////////////////
        //////////////////////////////////////////////
        /////AlamofireObjectMapper
        /*
        let URLs = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/d8bb95982be8a11a2308e779bb9a9707ebe42ede/sample_json"
        
        Alamofire.request(URLs).responseObject { (response: DataResponse<WeatherResponse>) in
            
            let weatherResponse = response.result.value
            print(weatherResponse?.location ?? "A")
            
            if let threeDayForecast = weatherResponse?.threeDayForecast {
                for forecast in threeDayForecast {
                    print(forecast.day!)
                    print(forecast.temperature!)
                }
            }
        }
       */
       
        
        
    }
    
    
    
}
