//
//  EditProfileVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/13/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import ProgressHUD
import Firebase

class EditProfileVC: UIViewController {
    @IBOutlet weak var profileImageView: Custom_UIImageView!
    @IBOutlet weak var nameTextField: Custom_UITextField!
    @IBOutlet weak var emailTextField: Custom_UITextField!
    
    
    var profileImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFoodyUser()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func imageEditButtonTapped(_ sender: Any) {
        presentImagePicker()
    }
    
    @IBAction func updateButtonTApped(_ sender: Any) {
        validateTextFields()
        let userData: Dictionary = [ UserData.USER_NAME: nameTextField.text!, UserData.UESR_EMAIL: emailTextField.text!]
        DataService.instance.updateDBUser(uid: Auth.auth().currentUser!.uid, userData: userData) { (success) in
            if success{
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
}



extension EditProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSelected = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        {
            profileImageView.image = imageSelected
            profileImage = imageSelected
        }
        
        if let imageOriginal = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            profileImage = imageOriginal
            profileImageView.image = imageOriginal
        }
        print("Dismissing picker")
        picker.dismiss(animated: true, completion: nil)
    }
}

//MARK: - FUNCTIONS
extension EditProfileVC {
    
    private func presentImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        self.present(imagePicker,animated: true, completion: nil)
    }
    
    private func validateTextFields() {
        
        emailTextField.validateField(withMessage: FieldValid.EMPTY_EMAIL)
        nameTextField.validateField(withMessage: FieldValid.EMPTY_USERNAME)
        
        
        guard profileImage != nil else {
            ProgressHUD.showError(FieldValid.EMPTY_PHOTO)
            return
        }
    }
    
    private func updateFoodyUser() {
        DataService.instance.getUserData(forUID: Auth.auth().currentUser!.uid) { (user) in
            self.nameTextField.text = user.name
            self.emailTextField.text = user.email
            print(user.imageUrl)
            self.profileImageView.load(from: user.imageUrl)
            
        }
    }
    
}


