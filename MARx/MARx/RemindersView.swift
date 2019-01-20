//
//  Reminders.swift
//  MARx
//
//  Created by Thomas Liang on 1/20/19.
//  Copyright © 2019 Solstice. All rights reserved.
//

import Foundation
import UIKit

class RemindersView: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        // Do any additional setup after loading the view, typically from a nib.
        let table = Table(numBoxes: 5, width: Int(screenWidth), view: self)
    }
    
    
}
