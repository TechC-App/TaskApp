//
//  ModelManager.swift
//  TaskApp
//
//  Created by Teacher on 2016/11/19.
//  Copyright © 2016年 AKYLab. All rights reserved.
//
// CoreDataの操作を管理するクラス

import Foundation
import MagicalRecord

internal final class ModelManager {
    static let sharedManager = ModelManager()
    
    private let context = NSManagedObjectContext.MR_defaultContext()
    
    func createTask() -> Task {
        let task = NSEntityDescription.insertNewObjectForEntityForName("Task", inManagedObjectContext: context) as! Task
        task.title = ""
        task.desc = ""
        task.date = NSDate()
        task.place = ""
        return task
    }
    
    func deleteTask(task: Task) {
        task.MR_deleteEntityInContext(context)
    }
    
    func insertTask(title: String, desc: String, date: NSDate, place: String) {
        
        let entity = NSEntityDescription.insertNewObjectForEntityForName("Task", inManagedObjectContext: context) as! Task
        entity.title = title
        entity.desc  = desc
        entity.date  = date
        entity.place = place
        try! context.save()
    }
    func allTask() -> [Task] {
        // クエリ生成、実行
        let request = NSFetchRequest()
        // from句に該当
        request.entity = NSEntityDescription.entityForName("Task", inManagedObjectContext: context)
        // TODO: orderの指定
        return try! context.executeFetchRequest(request) as! [Task]
    }
    func saveTask(task: Task) {
        try! context.save()
    }
}
