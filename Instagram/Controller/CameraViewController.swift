//
//  CameraViewController.swift
//  Instagram
//
//  Created by hor kimleng on 3/7/19.
//  Copyright © 2019 hor kimleng. All rights reserved.
//

import UIKit
import AlamofireImage
import Parse

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //IBOulets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var postButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    //Actions
    @IBAction func postButtonPressed(_ sender: Any) {
        let posts = PFObject(className: "Posts")
        
        posts["caption"] = commentTextField.text
        posts["author"] = PFUser.current()
        
        //image part
        let imageData = imageView.image?.pngData()
        let file = PFFileObject(data: imageData!)
        
        posts["image"] = file
        
        posts.saveInBackground { (success, error) in
            if success {
                print("saved!")
                self.dismiss(animated: true, completion: nil)
            } else {
                print("error")
            }
        }
    }
    
    @IBAction func cameraGestureRecognizer(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        //choose a new size for image
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageAspectScaled(toFill: size)
        
        imageView.image = scaledImage
        
        dismiss(animated: true, completion: nil)
    }
}
