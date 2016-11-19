//
//  TaskListViewController.swift
//  TaskApp
//
//  Created by Teacher on 2016/11/05.
//  Copyright © 2016年 AKYLab. All rights reserved.
//

import UIKit

internal final class TaskListViewController: UIViewController {
    /// タスク一覧
    private var taskList = [Task]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // タスク一覧の再取得・更新
        taskList = ModelManager.sharedManager.allTask()
        tableView.reloadData()
    }
}

extension TaskListViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let task = taskList[indexPath.row]
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "TaskListCell")
        cell.textLabel?.text = task.title
        return cell
    }
}

extension TaskListViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // FIXME: 暫定でアラートで詳細を表示
        let task = taskList[indexPath.row]
        let alert = UIAlertController(title: nil,
                                     message: task.desc,
                              preferredStyle: .Alert)
        let button = UIAlertAction(title: "OK",
                                    style: .Default,
            handler: nil)
        alert.addAction(button)
        presentViewController(alert, animated: true, completion: nil)
    }
}
