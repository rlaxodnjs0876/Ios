//
//  ReminderListViewController+Actions.swift
//  Today
//
//  Created by 김태원 on 2022/08/31.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton){
        guard let id = sender.id else { return }
        completeReminder(with: id)
    }
}
