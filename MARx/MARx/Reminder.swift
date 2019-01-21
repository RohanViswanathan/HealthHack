//
//  Reminder.swift
//  MARx
//
//  Created by Linus Zheng on 1/20/19.
//  Copyright © 2019 Solstice. All rights reserved.
//

import Foundation

class Reminder {
    
    var timer = Timer()
    
    init() {
        
    }
    
    @objc func showAlert(title: String, message: String) {
        let reminder = RemindersView()
        reminder.viewDidAppear(true)
    }
    
    @objc func timerHandler(time: Double, timerTitle: String, timerMessage: String) { //time in seconds
        _ = Timer.scheduledTimer(withTimeInterval: time, repeats: true) { timer in
            self.showAlert(title: timerTitle, message: timerMessage)
        }
    }
    
    @objc func daysToSecs(days: Double) -> Double {
        return days * 24 * 60 * 60;
    }

}
