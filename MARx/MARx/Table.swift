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
    var boxes: [UIButton] = []
    var scroll = UIScrollView()
    var view: TableViewDelegate!
    
    init(width: Int, height: Int, view: TableViewDelegate) {
        
        let meds = UserDefaults.standard.array(forKey: "meds") as! [String]
        
        let numBoxes = meds.count
        
        self.view = view
        self.scroll = UIScrollView(frame: CGRect(x: 1, y: 20, width: width+2, height: height))
        self.scroll.delegate = view
        self.scroll.contentSize = CGSize(width: CGFloat(width), height: CGFloat(100*numBoxes))
        
        for i in 0...numBoxes-1 {
            let string = meds[i]
            let parts = string.components(separatedBy: ";")
            
            let box = UIButton(frame: CGRect(x: 1, y: 20+(i*100), width: width+2, height: 100))
            box.setTitle("Take"+parts[0], for: .normal)
            box.backgroundColor = UIColor.white
            box.titleLabel!.textColor = UIColor.lightGray
            box.titleLabel!.textAlignment = .center
            box.layer.borderWidth = 1
            box.layer.borderColor = UIColor.lightGray.cgColor
            box.addTarget(view, action: #selector(buttonPressed), for: .touchUpInside)
            
            
            let time = UILabel(frame: CGRect(x: 250, y: 20+(i*100), width: width-248, height: 100))
            time.text = "12:00"
            time.textColor = UIColor.lightGray
            
            scroll.addSubview(box)
            scroll.addSubview(time)
            boxes.append(box)
        }
        
        view.mainView.addSubview(scroll)
    }
    
    @objc func buttonPressed() {
        
    }
    
    
}
