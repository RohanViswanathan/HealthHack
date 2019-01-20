//
//  Table.swift
//  MARx
//
//  Created by Thomas Liang on 1/20/19.
//  Copyright © 2019 Solstice. All rights reserved.
//

import Foundation
import UIKit

class Table {
    var boxes: [UILabel] = []
    
    init(numBoxes: Int, width: Int, height: Int) {
        for i in 0...numBoxes {
            let box = UILabel(frame: CGRect(x: 0, y: i*100, width: width, height: 100))
            box.text = "Hello"
            box.backgroundColor = UIColor.white
            box.textColor = UIColor.blue
            box.layer.borderWidth = 2
            box.layer.borderColor = UIColor.lightGray.cgColor
            boxes.append(box)
            
        }
        
        
    }
}
