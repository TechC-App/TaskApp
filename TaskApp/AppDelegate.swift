//
//  AppDelegate.swift
//  TaskApp
//
//  Created by Teacher on 2016/10/15.
//  Copyright © 2016年 AKYLab. All rights reserved.
//

import UIKit
import MagicalRecord

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        MagicalRecord.setupAutoMigratingCoreDataStack()
        
        NotificationManager.sharedManager.registerNotification()
        
        
        (0...10).forEach { index in
            ModelManager.sharedManager.insertTask("task\(index)", desc: "description\(index)", date: NSDate(), place: "")
        }

        return true
    }

    func applicationWillResignActive(application: UIApplication) {

    }

    func applicationDidEnterBackground(application: UIApplication) {

    }

    func applicationWillEnterForeground(application: UIApplication) {

    }

    func applicationDidBecomeActive(application: UIApplication) {

    }

    func applicationWillTerminate(application: UIApplication) {

    }
}

