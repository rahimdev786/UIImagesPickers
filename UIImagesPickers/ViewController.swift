//
//  ViewController.swift
//  UIImagesPickers
//
//  Created by arshad on 4/28/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imagePicker:UIImageView!{
        didSet{
            self.imagePicker.contentMode = .scaleAspectFill
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
      
    }
    @IBAction func getPicture(){
        self.setUpImagePicker()
    }
}

extension ViewController{
    func setUpImagePicker(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true)
        
    }
}

extension ViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage{
            imagePicker.image = image
        }
        picker.dismiss(animated: true)
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
