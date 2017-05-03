//
//  EditPhotoViewController.swift
//  SmartTalentExample
//
//  Created by Enrique Bermudez on 30/4/17.
//  Copyright © 2017 Enrique Bermúdez. All rights reserved.
//

import UIKit

class EditPhotoViewController: UIViewController {

    @IBOutlet weak var exposureSlider: UISlider!
    @IBOutlet weak var sepiaSlider: UISlider!
    @IBOutlet weak var imageView: UIImageView!
    
    public var image:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.image = self.image
    }
    
    @IBAction func sliderDidChangeValue(_ sender: Any) {
        self.imageView.image = ImageUtils.imageWithFilter(image: self.image!, sepiaTone: self.sepiaSlider.value, exposure: self.exposureSlider.value)
    }
   
}
