//
//  ViewController.swift
//  App
//
//  Created by liroy yarimi on 25.5.2018.
//  Copyright © 2018 Liroy Yarimi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var baseURL = ""
    
    
    
    
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let tempValue = readFromPlist(plistName: "APIKeys", key: "key1"){
            baseURL = tempValue
        }
        else{
            baseURL = "there is no key like this in the plist"
        }
        label.text = baseURL
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func readFromPlist(plistName : String, key : String) -> String?{
        var myDict: NSDictionary?
        if let path = Bundle.main.path(forResource: plistName, ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)
        }
        if let dict = myDict { //dict have all the plist
            print(dict)
            if let value = dict[key] as? String {//get the value of key newAPI
                //do something with your value
                print(value)
                return value
            }
        }
        return nil
    }
}

