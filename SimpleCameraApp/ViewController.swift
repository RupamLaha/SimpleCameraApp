//
//  ViewController.swift
//  SimpleCameraApp
//
//  Created by RUPAM LAHA on 04/05/20.
//  Copyright © 2020 RUPAM LAHA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var image: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.sourceType = UIImagePickerController.SourceType.camera
        imagePicker.delegate = self
        
    }

    @IBAction func clickPictureAction(_ sender: Any) {
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        image.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
        print("Camera has been canceled")
    }
    
}

