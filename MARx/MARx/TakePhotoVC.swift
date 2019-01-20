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
            imagePicker.showsCameraControls = false
            imagePicker.cameraFlashMode = UIImagePickerController.CameraFlashMode.on;
            present(imagePicker, animated: false) {
                imagePicker.takePicture()
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            medPhotoUI.contentMode = .scaleToFill
            medPhotoUI.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
        
        UIImageWriteToSavedPhotosAlbum(medPhotoUI.image!, nil, nil, nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
