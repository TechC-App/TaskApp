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
}
