//
//  Reminder.swift
//  MARx
//
//  Created by Linus Zheng on 1/20/19.
//  Copyright © 2019 Solstice. All rights reserved.
//

import Foundation

class Reminder {
    
    var howOften: String
    var timer = Timer()
    
    init(howOften: String) {
        self.howOften = howOften
    }
    
    @objc func showAlert(title: String, message: String) {
        let reminder = RemindersView()
        reminder.alertHandler(self, title: title, message: message)
    }
    
    @objc func timerHandler(time: Double, timerTitle: String, timerMessage: String) {
        _ = Timer.scheduledTimer(withTimeInterval: time, repeats: true) { timer in
            self.showAlert(title: timerTitle, message: timerMessage)
        }
    }

}
