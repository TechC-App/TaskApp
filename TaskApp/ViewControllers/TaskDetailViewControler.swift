//
//  TaskDetailViewControler.swift
//  TaskApp
//
//  Created by Teacher on 2016/11/05.
//  Copyright © 2016年 AKYLab. All rights reserved.
//

import UIKit

internal final class TaskDetailViewController: UIViewController {
    
    // MARK: IBOutlet
    
    /// タイトル
    @IBOutlet private weak var titleField: UITextField!
    @IBOutlet private weak var detailField: UITextField!
    @IBOutlet private weak var limitButton: UIButton!
    @IBOutlet private weak var placeButton: UIButton!
    
    // MARK: IBAction
    @IBAction private func didTapLimitButton(sender: UIButton) {
    }
    @IBAction private func didTapPlaceButton(sender: UIButton) {
    }
    @IBAction private func didTapSaveButton(sender: UIButton) {
    }
    
    var task: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        update()
    }
    
    private func update() {
        // 詳細・登録を兼ねるので、対象のTaskが存在する場合のみ表示を更新する
        if let task = task {
            titleField.text = task.title
            detailField.text = task.desc
            limitButton.titleLabel?.text = "\(task.date!)"
            placeButton.titleLabel?.text = task.place
        }
    }
}
