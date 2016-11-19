//
//  NotificationManager.swift
//  TaskApp
//
//  Created by Teacher on 2016/11/19.
//  Copyright © 2016年 AKYLab. All rights reserved.
//

import UIKit

internal final class NotificationManager {
    static let sharedManager = NotificationManager()
    
    // ローカル通知の許可
    func registerNotification() {
        let type: UIUserNotificationType = [.Alert, .Badge]
        let setting = UIUserNotificationSettings(forTypes: type, categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(setting)
    }
    
    
    // ローカル通知登録
    func scheduleNotification(text text: String,
                                    date: NSDate,
                              badgeCount: Int) {
        let notification = UILocalNotification()
        notification.alertBody = text
        notification.fireDate = date
        notification.applicationIconBadgeNumber = badgeCount
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
}
