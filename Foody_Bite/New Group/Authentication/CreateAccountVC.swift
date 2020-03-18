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
        guard let imageData = profileImage?.jpegData(compressionQuality: 0.4) else {return }
        guard let name = nameTextField.text else {return }
        guard let email = emailTextField.text else {return }
        guard let password = passwordTextField.text  else {return }
        
        if password == confirmPasswordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { (AuthResult, error) in
                
                guard let authData = AuthResult?.user, error == nil else { return  }
                
                
                var dict = [
                    "name": name,
                    "provider": authData.providerID,
                    "email": authData.email,
                    "profileImageUrl": "",
                    "status": "Welcome to FoodyBite"
                ]
                let REF_STORAGE = Storage.storage().reference(forURL: "gs://foody-bite.appspot.com")
                let storageProfileRef = REF_STORAGE.child("profile").child(authData.uid)
                
                let metaData = StorageMetadata()
                metaData.contentType = "image/jpg"
                storageProfileRef.putData(imageData, metadata: metaData, completion:{
                    (storateMetaData, error) in
                    if error != nil {
                        print(error?.localizedDescription)
                        return
                    }
                    
                    storageProfileRef.downloadURL { (url, error) in
                        if let metaImageUrl = url?.absoluteString{
                            print(metaImageUrl)
                            dict["profileImageUrl"] = metaImageUrl
                             DataService.instance.REF_USERS.child(authData.uid).updateChildValues(dict, withCompletionBlock: {
                                (error, ref) in
                                if error == nil {
                                    print("Done")
                                }
                            })
                            
                        }
                    }
                })
                
                
            }
        }
        
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        goTo(toVC: "LoginVC", animate: true)
    }
}

extension CreateAccountVC : UITextFieldDelegate {
    
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


extension CreateAccountVC {
    
    func registerNewUser(withName name: String, Email email: String, andPassword password: String, profileImage image: UIImage?, onCompletion: @escaping (_ success: Bool) -> ()){
        
    }
    
    func presentImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        self.present(imagePicker,animated: true, completion: nil)
    }
    
    
    
    
}


