//
//  CreateAccountVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/2/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit
import Dezignables
import IQKeyboardManagerSwift
import Firebase
import FirebaseStorage
import ProgressHUD

class CreateAccountVC: UIViewController {
    
    @IBOutlet weak var profileImageView: DezignableImageView!
    @IBOutlet weak var profileAvatorImageView: UIImageView!
    @IBOutlet weak var imageUploadButton: UIButton!
    @IBOutlet weak var nameTextField: DesignableUITextField!
    @IBOutlet weak var emailTextField: DesignableUITextField!
    @IBOutlet weak var passwordTextField: DesignableUITextField!
    @IBOutlet weak var confirmPasswordTextField: DesignableUITextField!
    @IBOutlet weak var registerButton: DezignableButton!
    
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
        goTo(toVC: "LoginVC", animate: true)
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
    
    func validateTextFields() {
        confirmPasswordTextField.validateField(withMessage: CONFIRM_PASSWORD_TEXT_FIELD_MESSAGE)
        passwordTextField.validateField(withMessage: PASSWORD_TEXT_FIELD_MESSAGE)
        emailTextField.validateField(withMessage: EMAIL_TEXT_FIELD_MESSAGE)
        nameTextField.validateField(withMessage: USER_NAME_TEXT_FIELD_MESSAGE)
        
        if passwordTextField.text! != confirmPasswordTextField.text! {
            ProgressHUD.showError(PASSWORD_NOT_MATCH_MESSAGE)
        }
        
        guard profileImage != nil else {
            ProgressHUD.showError(PROFILE_IMAGE_MESSAGE)
            return
        }
    }
    func signUp() {
        ProgressHUD.show()
        self.validateTextFields()
        AuthService.instance.createUser(withEmail:emailTextField.text!, andPassword: passwordTextField.text!) { (user) in
            guard let user = user else {return}
            var dict = [
                USER_NAME: self.nameTextField.text!,
                PROVIDER: user.providerID,
                UESR_EMAIL: self.emailTextField.text!,
                PROFILE_IMAGE_URL: ""
            ]
            
            StorageServices.instance.uploadImage(withUID: user.uid, andImage: self.profileImageView.image!) { (url) in
                if let url = url {
                    dict[PROFILE_IMAGE_URL] = url
                    DataService.instance.createDBUser(uid: user.uid, userData: dict) {(success) in
                        if success {
                            ProgressHUD.showSuccess(USER_DATA_SAVED_MESSAGE)
                            ProgressHUD.dismiss()
                            self.goTo(toVC: "LoginVC", animate: true)
                        } else {
                            ProgressHUD.showError(REGISTRATION_FAILED_MESSAGE)
                            ProgressHUD.dismiss()
                        }
                    }
                }
            }
        }
    }
    
}


