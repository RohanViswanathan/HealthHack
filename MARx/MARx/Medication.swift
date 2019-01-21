//
//  Medication.swift
//  MARx
//
//  Created by Linus Zheng on 1/20/19.
//  Copyright © 2019 Solstice. All rights reserved.
//

import Foundation

class Medication: Reminder {
    
    var imprint: String
    var dosage: String
    
    //var table: Table
    
    init(imprint: String, dosage: String, howOften: String) {
        self.imprint = imprint
        self.dosage = dosage
        super.init()
    }
    
}
