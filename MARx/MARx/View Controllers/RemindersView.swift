//
//  Reminders.swift
//  MARx
//
//  Created by Thomas Liang on 1/20/19.
//  Copyright © 2019 Solstice. All rights reserved.
//

import Foundation
import UIKit

class RemindersView: UIViewController, UIScrollViewDelegate {
    var table: Table!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        // Do any additional setup after loading the view, typically from a nib.
        table = Table(numBoxes: 50, width: Int(screenWidth), height: Int(screenHeight), view: self)
    }
    
    @objc func buttonPressed(sender: UIButton!) {
        let medView: MedVC = MedVC()
        let newViewController = self.storyboard?.instantiateViewController(withIdentifier:"Med VC")
        self.present(newViewController!, animated: true, completion: nil)
    }
    
    @objc func alertHandler(_ sender: Any, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}
