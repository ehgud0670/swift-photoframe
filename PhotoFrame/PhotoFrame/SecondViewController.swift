//
//  SecondViewController.swift
//  PhotoFrame
//
//  Created by kimdo2297 on 2020/02/03.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextImageButtonTouched(_ sender: UIButton) {
        let randomNum = Int.random(in: 1...22)
        let resource = String(format: "%02d.jpg", randomNum)
        self.photoImageView.image = UIImage(named: resource)
        self.photoImageView.contentMode = .scaleAspectFill
    }
    
    @IBAction func selectButtonTouched(_ sender: UIButton) {
        let picker : UIImagePickerController = {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.allowsEditing = false
            return picker
        }()
        self.present(picker, animated: false)
    }
        
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.photoImageView.image = info[.originalImage] as? UIImage
        self.photoImageView.contentMode = .scaleAspectFill
        picker.dismiss(animated: false)
    }
    
}
