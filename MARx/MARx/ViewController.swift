//
//  ViewController.swift
//  MARx
//
//  Created by Rohan Viswanathan on 1/20/19.
//  Copyright © 2019 Solstice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var popup: UIView!
    @IBOutlet weak var medName: UITextField!
    @IBOutlet weak var medID: UITextField!
    @IBOutlet weak var medInfo: UITextView!
    @IBOutlet weak var days: UITextField!
    @IBOutlet weak var times: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
    }

    @IBAction func addMeds(_ sender: Any) {
        popup.isHidden = false
    }
    
    @IBAction func SaveMed(_ sender: Any) {
        let name = medName.text
        let id = medID.text
        let info = medInfo.text
        let days = medName.text!
        let times = medName.text!
        
        let fullString = name+";"+id+";"+info+";"+days+";"+times
        
        let meds = UserDefaults.standard.array(forKey: "meds")
        meds.append(fullString)
        
        UserDefaults.standard.set(meds, forKey: "meds")
        
        popup.isHidden = true
    }
}

