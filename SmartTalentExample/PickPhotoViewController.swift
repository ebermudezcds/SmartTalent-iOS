//
//  PickPhotoViewController.swift
//  SmartTalentExample
//
//  Created by Enrique Bermudez on 30/4/17.
//  Copyright © 2017 Enrique Bermúdez. All rights reserved.
//

import UIKit

class PickPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var editBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imagePicker.sourceType = .savedPhotosAlbum
        self.imagePicker.delegate = self
    }

    @IBAction func pickImageAction(_ sender: Any) {
    
        present(self.imagePicker, animated: true, completion: nil)

    }
   
    // MARK: - UIImagePicker delegate methods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
        
            self.imageView.image = ImageUtils.resizeImage(image: selectedImage, targetSize: self.imageView.frame.size)
            self.editBarButtonItem.isEnabled = true
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if let editPhotoViewController = segue.destination as? EditPhotoViewController {
            
            editPhotoViewController.image = self.imageView.image
        }
    }
}
