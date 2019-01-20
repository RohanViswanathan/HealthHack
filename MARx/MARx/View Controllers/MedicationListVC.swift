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
    
    
    var table: Table!

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView = view
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        table = Table(numBoxes: 2, width: Int(screenWidth), height: Int(screenHeight)-20, view: self)
    }

}

