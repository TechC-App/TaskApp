//
//  TaskListViewController.swift
//  TaskApp
//
//  Created by Teacher on 2016/11/05.
//  Copyright © 2016年 AKYLab. All rights reserved.
//

import UIKit

internal final class TaskListViewController: UIViewController {
    
}

extension TaskListViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // FIXME: 暫定で10行固定
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "TaskListCell")
        cell.textLabel?.text = "タスク\(indexPath.row + 1)"
        return cell
    }
}

extension TaskListViewController: UITableViewDelegate {
    
}
