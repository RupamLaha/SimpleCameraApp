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
    @IBOutlet weak var removePhoto: UIButton!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        removePhotoButtonVisibility()
        
    }
    
    func removePhotoButtonVisibility(){
        
        if image.image != nil {
                   removePhoto.isHidden = false
               }
        else{
            removePhoto.isHidden = true
        }
    }
    
    @IBAction func removePhotoAction(_ sender: Any) {
        
        image.image = nil
        removePhoto.isHidden = true
        
    }
    
    @IBAction func clickPictureAction(_ sender: Any) {
        
        imagePicker.sourceType = UIImagePickerController.SourceType.camera
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func fromGelleryAction(_ sender: Any) {
        
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if imagePicker.sourceType == UIImagePickerController.SourceType.camera{
            picker.dismiss(animated: true, completion: nil)
            image.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            imagePicker.delegate = nil
            self.removePhotoButtonVisibility()
        }
        else{
            
            picker.dismiss(animated: true, completion: nil)
            image.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            imagePicker.delegate = nil
            self.removePhotoButtonVisibility()
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
//        print("Camera has been canceled")
    }
    
}

