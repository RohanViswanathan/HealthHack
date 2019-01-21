//
//  MedicationListVC
//  MARx
//
//  Created by Rohan Viswanathan on 1/20/19.
//  Copyright © 2019 Solstice. All rights reserved.
//

import UIKit

class MedicationListVC: UIViewController, TableViewDelegate {
    
    var mainView: UIView!
    
    func buttonPressed() {
        
    }
    
    @IBOutlet weak var popup: UIView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var info: UITextView!
    @IBOutlet weak var days: UITextField!
    @IBOutlet weak var times: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let med: [String] = []
        UserDefaults.standard.set(med, forKey: "meds")
        
        mainView = view
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
    }
    
    @IBAction func add(_ sender: Any) {
        popup.isHidden = false
    }
    
    @IBAction func save(_ sender: Any) {
        print("hello!")
        
        var full = name.text!+";"+id.text!
        full += ";"+info.text!
        full += ";"+days.text!+";"+times.text!
        var meds = UserDefaults.standard.array(forKey: "meds")
        if (meds != nil) {
            var newmeds: [String] = UserDefaults.standard.array(forKey: "meds") as! [String]
            newmeds.append(full)
            
            UserDefaults.standard.set(newmeds, forKey: "meds")
        } else {
            meds = []
            meds?.append(full)
            UserDefaults.standard.set(meds, forKey: "meds")
        }
        
        print(UserDefaults.standard.array(forKey: "meds") as! [String])
        
        self.view.endEditing(true)
        
        name.text = ""
        id.text = ""
        info.text = ""
        days.text = ""
        times.text = ""
        
        popup.isHidden = true
        let timer = Reminder()
        //for m in meds as! [String] {
        print(days.text!)
        print(name.text!)
        timer.timerHandler(time: Double(0.5)*60.0, timerTitle: "Take "+name.text!, timerMessage: "Remember to take your medicine")
            
        //}
        
    }
}

