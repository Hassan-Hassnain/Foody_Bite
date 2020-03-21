//
//  File.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/20/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import Foundation
import UIKit




//MARK: - AUTHENTICATION GROUP

//User Data
let USER_NAME = "userName"
let PROVIDER = "provider"
let UESR_EMAIL = "email"
let PROFILE_IMAGE_URL = "profileImageURL"

//Text Field Validation
let EMPTY_USERNAME_MESSAGE = "Please enter username"
let EMPTY_EMAIL_MESSAGE = "Please enter email address"
let EMPTY_PASSWORD_MESSAGE = "Please enter password"
let EMPTY_CONFIRM_PASSWORD_MESSAGE = "Please confirm your password"
let EMPTY_PHOTO_MESSAGE = "Please chose your photo"
let EMPTY_CURRENT_PASSWORD = "Please enter your current password"
let EMPTY_NEW_PASSWORD = "Please enter new password"
let PASSWORD_NOT_MATCH_MESSAGE = "Password does not matach"

//Firebase Messages
let USER_DATA_SAVED_MESSAGE = "User data saved successfully"
let REGISTRATION_FAILED_MESSAGE = "User registration failed"
let USER_LOGIN_FAIL_MESSAGE = "Login failed: Check your email and password and try again"
let PASSWORD_CHANGE_SUCCESSFUL_MESSAGE = "Password reset link sent to your email,\nreset your passowrd and try agian"
let USER_ALREADY_SIGNED_IN = "user allready signed in with"



struct Storyboards {
    static let main = UIStoryboard(name: "Main", bundle: Bundle.main)           //1
    static let signUp = UIStoryboard(name: "SignUp", bundle: Bundle.main)       //2
    static let home = UIStoryboard(name: "Home", bundle: Bundle.main)           //3
    static let favorite = UIStoryboard(name: "Favorite", bundle: Bundle.main)   //4
    static let profile = UIStoryboard(name: "Profile", bundle: Bundle.main)     //5
    static let review = UIStoryboard(name: "Review", bundle: Bundle.main)       //6
}
