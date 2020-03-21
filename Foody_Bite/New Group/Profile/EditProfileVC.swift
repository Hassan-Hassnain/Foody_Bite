//
//  EditProfileVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/13/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import ProgressHUD
import Dezignables
import Firebase

class EditProfileVC: UIViewController {
    @IBOutlet weak var profileImageView: DezignableImageView!
    @IBOutlet weak var nameTextField: DesignableUITextField!
    @IBOutlet weak var emailTextField: DesignableUITextField!
    
   
    var profileImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFoodyUser()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        dismissDetail()
    }
    @IBAction func imageEditButtonTapped(_ sender: Any) {
        presentImagePicker()
    }
    
    @IBAction func updateButtonTApped(_ sender: Any) {
        validateTextFields()
        let userData: Dictionary = [ USER_NAME: nameTextField.text!, UESR_EMAIL: emailTextField.text!]
        DataService.instance.updateDBUser(uid: Auth.auth().currentUser!.uid, userData: userData) { (success) in
            if success{
                self.dismissDetail()
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
   
        emailTextField.validateField(withMessage: EMPTY_EMAIL_MESSAGE)
        nameTextField.validateField(withMessage: EMPTY_USERNAME_MESSAGE)

        
        guard profileImage != nil else {
            ProgressHUD.showError(EMPTY_PHOTO_MESSAGE)
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


