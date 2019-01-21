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
    var times: [UILabel] = []
    var scroll = UIScrollView()
    var view: RemindersView!
    
    var w = 0
    var h = 0
    
    init(width: Int, height: Int, view: RemindersView) {
        w = width
        h = height
        
        if (UserDefaults.standard.array(forKey: "meds") != nil) {
            if (UserDefaults.standard.array(forKey: "meds")!.count > 0) {
                let meds = UserDefaults.standard.array(forKey: "meds") as! [String]
                
                let numBoxes = meds.count
                
                self.view = view
                self.scroll = UIScrollView(frame: CGRect(x: 1, y: 50, width: width+2, height: height))
                self.scroll.delegate = view
                self.scroll.contentSize = CGSize(width: CGFloat(width), height: CGFloat(100*numBoxes))
                
                for i in 0...numBoxes-1 {
                    let string = meds[i]
                    let parts = string.components(separatedBy: ";")
                    
                    let box = UIButton(frame: CGRect(x: 1, y: 50+(i*100), width: width+2, height: 100))
                    box.setTitle("Take "+parts[0], for: .normal)
                    box.setTitleColor(.black, for: .normal)
                    box.titleLabel!.frame = CGRect(x: 1, y: 50+(i*100), width: width+2, height: 100)
                    box.titleLabel!.textAlignment = .left
                    box.backgroundColor = UIColor.white
                    box.layer.borderWidth = 1
                    box.layer.borderColor = UIColor.lightGray.cgColor
                    box.addTarget(view, action: #selector(RemindersView.buttonPressed), for: .touchUpInside)
                    
                    
                    let time = UILabel(frame: CGRect(x: 250, y: 50+(i*100), width: width-248, height: 100))
                    time.text = "12:00"
                    time.textColor = UIColor.lightGray
                    
                    scroll.addSubview(box)
                    scroll.addSubview(time)
                    boxes.append(box)
                    times.append(time)
                }
            }
        }
        
        view.mainView.addSubview(scroll)
    }
    
    func reload() {
        let meds = UserDefaults.standard.array(forKey: "meds") as! [String]
        
        if (boxes.count > 0) {
            for i in 0...boxes.count-1 {
                boxes[i].removeFromSuperview()
                times[i].removeFromSuperview()
            }
        }
        
        let numBoxes = meds.count
        print(numBoxes)
        
        for i in 0...numBoxes-1 {
            let string = meds[i]
            let parts = string.components(separatedBy: ";")
            print(parts[0])
            
            let box = UIButton(frame: CGRect(x: 1, y: 50+(i*100), width: w+2, height: 100))
            box.setTitle("Take "+parts[0], for: .normal)
            box.setTitleColor(.black, for: .normal)
            box.titleLabel!.frame = CGRect(x: 1, y: 50+(i*100), width: w+2, height: 100)
            box.titleLabel!.textAlignment = .left
            box.backgroundColor = UIColor.white
            box.layer.borderWidth = 1
            box.layer.borderColor = UIColor.lightGray.cgColor
            box.addTarget(view, action: #selector(view.buttonPressed), for: .touchUpInside)
            
            
            let time = UILabel(frame: CGRect(x: 250, y: 50+(i*100), width: w-248, height: 100))
            time.text = "12:00"
            time.textColor = UIColor.lightGray
            
            scroll.addSubview(box)
            scroll.addSubview(time)
            boxes.append(box)
            times.append(time)
        }
    }
    
    @objc func buttonPressed() {
        print("in")
        view.buttonPressed()
    }
    
    
}
