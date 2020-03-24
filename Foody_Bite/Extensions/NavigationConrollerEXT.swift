//
//  NavigationConrollerEXT.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/22/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

extension UINavigationController {
    func customPush(_ viewController: String, animate: Bool) {
        let storyBoard = treversStoryBoards(name: viewController)
        let vc = storyBoard.instantiateViewController(identifier: viewController)
        self.pushViewController(vc, animated: true)
    }
    
    private func treversStoryBoards(name: String) -> UIStoryboard{
        var requiredStoryboard: UIStoryboard?
        let MAIN: [String] = [
            HomeVC.className,
            MainTabBarController.className,
            NewReviewVC.className,
            MyFavoriteVC.className,
            ProfileVC.className
        ]
        let SIGNUP: [String] = [
            StartVC.className,
            LoginVC.className,
            ForgotPasswordVC.className,
            CreateAccountVC.className,
            GPS_VC.className
        ]
        let HOME: [String] = [
            TrendingRestaurantsVC.className,
            FilterVC.className,
            TrendingRestaurantItemDetailsVC.className,
            RatingAndReviewVC.className,
            FindFriendsVC.className,
            FilterResultsVC.className,
            CategoriesVC.className,
            CategoryDetailsVC.className,
            OtherUserProfileVC.className,
            MenuAndPhotosVC.className,
            PreviewVC.className,
            AllReviewAndRatingVC.className,
        ]
        let REVIEW: [String] = [NewReviewVC.className]
        let FAVORITE: [String] = [MyFavoriteDetailsVC.className]
        let PROFILE: [String] = [
            EditReviewVC.className,
            FollowersVC.className,
            FollowingVC.className,
            ReviewsVC.className,
            SettingsVC.className,
            ChangePasswordVC.className,
            ChangeLanguageVC.className,
            EditProfileVC.className,
        ]
        let controllers = [MAIN, SIGNUP,HOME,REVIEW,FAVORITE,PROFILE]
        for group in controllers {
            for required in group {
                if name == required {
                    switch group {
                    case MAIN:
                        requiredStoryboard = Storyboards.main
                        case SIGNUP:
                        requiredStoryboard = Storyboards.signUp
                        case HOME:
                        requiredStoryboard = Storyboards.home
                        case REVIEW:
                        requiredStoryboard = Storyboards.review
                        case FAVORITE:
                        requiredStoryboard = Storyboards.favorite
                        case PROFILE:
                            requiredStoryboard = Storyboards.profile
                    default:
                        requiredStoryboard = Storyboards.main
                    }
                }
            }
        }
        return requiredStoryboard!
    }
}
