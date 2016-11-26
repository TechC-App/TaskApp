//
//  TaskListTableViewCell.swift
//  TaskApp
//
//  Created by Teacher on 2016/11/26.
//  Copyright © 2016年 AKYLab. All rights reserved.
//

import UIKit

internal final class TaskListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    
    /// セルに表示する対象のTaskを受け取り、表示を更新する
    func update(task: Task) {
        titleLabel.text = task.title
        dateLabel.text = "\(task.date)"
        placeLabel.text = task.place
    }
}
