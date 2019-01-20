//
//  ViewController.swift
//  MARx
//
//  Created by Rohan Viswanathan on 1/20/19.
//  Copyright © 2019 Solstice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onMedTakePic(_ sender: Any) {
        let takePhoto = MedVC()
        takePhoto.takeAndSaveImage()
    }
    
    @IBAction func testPic(_ sender: Any) {
        let takePhoto = MedVC()
        takePhoto.takeAndSaveImage()
    }
}

