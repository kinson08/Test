//
//  ViewController.swift
//  Test
//
//  Created by mac on 2019/4/2.
//  Copyright © 2019年 mac. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import PySwiftyRegex

class ViewController: UIViewController {

    @IBOutlet weak var myTextView: UITextView!
    var myUrl = "http://hq.sinajs.cn/list=sh601006"
//    var myUrl = "http://www.baidu.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        testReg()
    }

    func testReg(){
        if let m = re.search("[Tt]his is (.*?)easy", "I think this is really easy!!!") {
            print(m.group())
        }
    }
    
    @IBAction func GetWebPageBut(_ sender: UIButton) {
        Alamofire.request(myUrl).responseString{
            response in
//            print("result is \(response.result)")
//            print("request is \(response.request)")
//            print("data is \(response.data)")
//            print("response is \(response.response)")

            
            if let myStr = response.result.value{
                let strArr:[String] = myStr.components(separatedBy: "=")
                let strArr2:[String] = strArr[1].components(separatedBy: "\"")
                let strArr3:[String] = strArr2[1].components(separatedBy: ",")
                let showStr = strArr3.joined(separator: "\n")
                self.myTextView.text = showStr
                //
//                self.myTextView.text = myStr
            }
        }
//        myTextView.text = "This is the text"
    }
}

//test for github
