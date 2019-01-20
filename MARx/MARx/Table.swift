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
    var scroll = UIScrollView()
    
    
    init(numBoxes: Int, width: Int, height: Int, view: RemindersView) {
        self.scroll = UIScrollView(frame: CGRect(x: 1, y: 20, width: width+2, height: height))
        self.scroll.delegate = view
        self.scroll.contentSize = CGSize(width: CGFloat(width), height: CGFloat(100*numBoxes))
        
        
        for i in 0...numBoxes {
            let box = UILabel(frame: CGRect(x: 1, y: 20+(i*100), width: width+2, height: 100))
            box.text = "Hello"
            box.backgroundColor = UIColor.white
            box.textColor = UIColor.lightGray
            box.textAlignment = .center
            box.layer.borderWidth = 1
            box.layer.borderColor = UIColor.lightGray.cgColor
            scroll.addSubview(box)
            boxes.append(box)
        }
        
        view.view.addSubview(scroll)
    }
}
