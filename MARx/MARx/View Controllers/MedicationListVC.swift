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
        mainView = view
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
    }
    
    @IBAction func add(_ sender: Any) {
        popup.isHidden = false
    }
    
    @IBAction func save(_ sender: Any) {
        
        var full = name.text!+";"+id.text!
        full += ";"+info.text!
        full += ";"+days.text!+";"+times.text!
        var meds = UserDefaults.standard.array(forKey: "meds") as! [String]
        meds.append(full)
        
        UserDefaults.standard.set(meds, forKey: "meds")
        
        popup.isHidden = true
    }
}

