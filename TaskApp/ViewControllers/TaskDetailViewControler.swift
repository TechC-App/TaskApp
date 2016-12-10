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
    @IBOutlet private weak var limitButton: UILabel!
    @IBOutlet private weak var placeButton: UIButton!
    @IBOutlet private weak var datePicker: UIDatePicker!
    
    // MARK: IBAction
    @IBAction private func didTapPlaceButton(sender: UIButton) {
    }
    /// 保存ボタンタップ
    @IBAction private func didTapSaveButton(sender: UIButton) {
        guard let task = task else {
            // 例外処理
            return
        }
        ModelManager.sharedManager.saveTask(task)

    }
    /// 日付選択
    @IBAction private func didChangePickerValue(sender: UIDatePicker) {
        task?.date = sender.date
        update()
    }
    /// タイトル更新
    @IBAction private func didChangeTitle(sender: UITextField) {
        task?.title = sender.text
    }
    /// 詳細更新
    @IBAction private func didChangeDetail(sender: UITextField) {
        task?.desc = sender.text
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
            limitButton.text = "\(task.date!)"
            placeButton.titleLabel?.text = task.place
        }
    }
}

extension TaskDetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        // 対象のTextFieldに応じて出しわけ
        if textField == titleField {
            task?.title = textField.text
        } else if textField == detailField {
            task?.desc = textField.text
        }
        
        return true
    }
}
