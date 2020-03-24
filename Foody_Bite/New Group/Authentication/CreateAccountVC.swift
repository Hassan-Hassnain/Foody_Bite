//
//  CreateAccountVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/2/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase
import FirebaseStorage
import ProgressHUD

class CreateAccountVC: UIViewController {
    
    @IBOutlet weak var profileImageView: Custom_UIImageView!
    @IBOutlet weak var profileAvatorImageView: UIImageView!
    @IBOutlet weak var imageUploadButton: UIButton!
    @IBOutlet weak var nameTextField: Custom_UITextField!
    @IBOutlet weak var emailTextField: Custom_UITextField!
    @IBOutlet weak var passwordTextField: Custom_UITextField!
    @IBOutlet weak var confirmPasswordTextField: Custom_UITextField!
    @IBOutlet weak var registerButton: Custom_UIImageView!
    
    var profileImage: UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 200
        
    }
    
    @IBAction func imageUploadButtonTapped(_ sender: Any) {
        presentImagePicker()
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        signUp()
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}


//MARK: - EXTENSIONS
extension CreateAccountVC : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
    //FOR TESTING PURPOSE ONLY
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            emailTextField.text = "\(String(describing: nameTextField.text!))@test.com"
        }
    }
}



extension CreateAccountVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSelected = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        {
            profileImageView.image = imageSelected
            profileImage = imageSelected
            profileAvatorImageView.isHidden = true
        }
        
        if let imageOriginal = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            profileImage = imageOriginal
            profileImageView.image = imageOriginal
            profileAvatorImageView.isHidden = true
        }
        print("Dismissing picker")
        picker.dismiss(animated: true, completion: nil)
    }
}

//MARK: - FUNCTIONS
extension CreateAccountVC {
    
    func presentImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        self.present(imagePicker,animated: true, completion: nil)
    }
    
    private func validateTextFields() {
        confirmPasswordTextField.validateField(withMessage: FieldValid.EMPTY_CONFIRM_PASSWORD)
        passwordTextField.validateField(withMessage: FieldValid.EMPTY_PASSWORD)
        emailTextField.validateField(withMessage: FieldValid.EMPTY_EMAIL)
        nameTextField.validateField(withMessage: FieldValid.EMPTY_USERNAME)
        
        if passwordTextField.text! != confirmPasswordTextField.text! {
            ProgressHUD.showError(FieldValid.PASSWORD_NOT_MATCH)
        }
        
        guard profileImage != nil else {
            ProgressHUD.showError(FieldValid.EMPTY_PHOTO)
            return
        }
    }
    func signUp() {
        ProgressHUD.show()
        self.validateTextFields()
        AuthService.instance.createUser(withEmail:emailTextField.text!, andPassword: passwordTextField.text!) { (user) in
            guard let user = user else {return}
            var dict = [
                UserData.USER_NAME: self.nameTextField.text!,
                UserData.PROVIDER: user.providerID,
                UserData.UESR_EMAIL: self.emailTextField.text!,
                UserData.PROFILE_IMAGE_URL: ""
            ]
            
            StorageServices.instance.uploadImage(withUID: user.uid, andImage: self.profileImageView.image!) { (url) in
                if let url = url {
                    dict[UserData.PROFILE_IMAGE_URL] = url
                    DataService.instance.updateDBUser(uid: user.uid, userData: dict) {(success) in
                        if success {
                            ProgressHUD.showSuccess(FireMessages.USER_DATA_SAVED)
                            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
                                self.navigationController?.customPush(LoginVC.className, animate: true)
                            })
                        } else {
                            ProgressHUD.showError(FireMessages.REGISTRATION_FAILED)
                            ProgressHUD.dismiss()
                        }
                    }
                }
            }
        }
    }
    
}


