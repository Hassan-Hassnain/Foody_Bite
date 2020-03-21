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
struct UserData {
    static let USER_NAME = "userName"
    static let PROVIDER = "provider"
    static let UESR_EMAIL = "email"
    static let PROFILE_IMAGE_URL = "profileImageURL"
}

//Text Field Validation
struct FieldValid {
    static let EMPTY_USERNAME = "Please enter username"
    static let EMPTY_EMAIL = "Please enter email address"
    static let EMPTY_PASSWORD = "Please enter password"
    static let EMPTY_CONFIRM_PASSWORD = "Please confirm your password"
    static let EMPTY_PHOTO = "Please chose your photo"
    static let EMPTY_CURRENT_PASSWORD = "Please enter your current password"
    static let EMPTY_NEW_PASSWORD = "Please enter new password"
    static let PASSWORD_NOT_MATCH = "Password does not matach"
}

//Firebase Messages
struct FireMessages {
    static let USER_DATA_SAVED = "User data saved successfully"
    static let REGISTRATION_FAILED = "User registration failed"
    static let USER_LOGIN_FAIL = "Login failed: Check your email and password and try again"
    static let PASSWORD_CHANGE_SUCCESSFUL = "Password reset link sent to your email,\nreset your passowrd and try agian"
    static let USER_ALREADY_SIGNED_IN = "user allready signed in with"
}

//StoryBoards
struct Storyboards {
    static let main = UIStoryboard(name: "Main", bundle: Bundle.main)           //1
    static let signUp = UIStoryboard(name: "SignUp", bundle: Bundle.main)       //2
    static let home = UIStoryboard(name: "Home", bundle: Bundle.main)           //3
    static let favorite = UIStoryboard(name: "Favorite", bundle: Bundle.main)   //4
    static let profile = UIStoryboard(name: "Profile", bundle: Bundle.main)     //5
    static let review = UIStoryboard(name: "Review", bundle: Bundle.main)       //6
}

struct Icons {
    static let FILTER = UIImage(named: "Icon_Filter.png")
    static let STAR_YELLOW = UIImage(named: "Icon_Star_Yellow.png")
    static let STAR_GREY = UIImage(named: "Icon_Star_Grey.png")
    static let CLOSE_GREY = UIImage(named: "Icon_Close_Grey.png")
    static let SEARCH = UIImage(named: "Icon_Search_grey.png")
    static let OK = UIImage(named: "Icon_Ok_Blue.png")
    static let WHITE_CIRCLE = UIImage(named: "Icon_Circle_White.png")
}
