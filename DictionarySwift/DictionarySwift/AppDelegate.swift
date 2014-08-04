//
//  AppDelegate.swift
//  DictionarySwift
//
//  Created by Markus Persson on 25/07/14.
//  Copyright (c) 2014 ustwo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?

    func jsonResponse() -> [String : AnyObject] {
        let path = NSBundle.mainBundle().pathForResource("data", ofType: "json")
        let data = NSData.dataWithContentsOfFile(path, options: NSDataReadingOptions.DataReadingUncached, error: nil)
        
        let json: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil)
        return json as [String : AnyObject]
    }
    
    func parseResponse() {
        let json = jsonResponse()
        println("JSON: \(json)")
        
        let employees = json["employees"]! as [[String : AnyObject]]
        
        for employee in employees {
            let firstName = employee["firstName"]! as String
            let lastName = employee["lastName"]! as String
            
            println("employee: \(firstName) \(lastName)")
        }
    }
    
    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        parseResponse()

        return true
    }
    
}

