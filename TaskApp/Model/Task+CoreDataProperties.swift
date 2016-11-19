//
//  Task+CoreDataProperties.swift
//  TaskApp
//
//  Created by Teacher on 2016/11/19.
//  Copyright © 2016年 AKYLab. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Task {

    @NSManaged var title: String?
    @NSManaged var desc: String?
    @NSManaged var date: NSDate?
    @NSManaged var place: String?

}
