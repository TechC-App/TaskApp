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
        // セルの登録
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "TaskListTableViewCell")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
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
        let cell = tableView.dequeueReusableCellWithIdentifier("TaskListTableViewCell")!
        cell.textLabel?.text = cellText(task)
        return cell
    }
    
    /// 完了ボタンのラベル変更
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "完了"
    }
}

extension TaskListViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 詳細画面に遷移
        let task = taskList[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let viewController = storyboard.instantiateViewControllerWithIdentifier("TaskDetailViewController") as! TaskDetailViewController
        viewController.task = task
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    /// 完了時のアクション
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // TODO: CoreDataの更新
        taskList.removeAtIndex(indexPath.row)
        tableView.reloadData()
    }
}

// FIXME: 後で削除
extension TaskListViewController {
    func cellText(task: Task) -> String {
        return "\(task.title!)   \(task.date!)   \(task.place!)"
    }
}
