//
//  TakePhotoVC.swift
//  MARx
//
//  Created by Linus Zheng on 1/20/19.
//  Copyright © 2019 Solstice. All rights reserved.
//

import UIKit

class TakePhotoVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var medPhotoUI: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @objc func takeAndSaveImage() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self;
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            medPhotoUI.contentMode = .scaleToFill
            medPhotoUI.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }


}
