//
//  MenuAndPhotosVC.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/7/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class MenuAndPhotosVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var images:[UIImage] = [#imageLiteral(resourceName: "11"), #imageLiteral(resourceName: "1"), #imageLiteral(resourceName: "10"), #imageLiteral(resourceName: "9"), #imageLiteral(resourceName: "7"), #imageLiteral(resourceName: "Icon_Home_Grey"), #imageLiteral(resourceName: "dummy-Title"), #imageLiteral(resourceName: "BG_Food_Image_Shadow_Layer"), #imageLiteral(resourceName: "Icon_Search_Black"), #imageLiteral(resourceName: "BG_GPS_Reguest"), #imageLiteral(resourceName: "BG-Splash-Screen1"), #imageLiteral(resourceName: "BG-Login"), #imageLiteral(resourceName: "Icon_Ok_Green"), #imageLiteral(resourceName: "Icon_Bell_Grey"), #imageLiteral(resourceName: "Icon_Forward"), #imageLiteral(resourceName: "Icon_Ok_Blue"), #imageLiteral(resourceName: "dummy_Profile_image"), #imageLiteral(resourceName: "Icon_Home_Grey"), #imageLiteral(resourceName: "dummy-Title"), #imageLiteral(resourceName: "BG_Food_Image_Shadow_Layer"), #imageLiteral(resourceName: "Icon_Ok_Green"), #imageLiteral(resourceName: "Icon_Bell_Grey"), #imageLiteral(resourceName: "Icon_Forward"), #imageLiteral(resourceName: "Icon_Ok_Blue"), #imageLiteral(resourceName: "dummy_Profile_image"), #imageLiteral(resourceName: "Icon_Home_Grey"), #imageLiteral(resourceName: "dummy-Title"), #imageLiteral(resourceName: "BG_Food_Image_Shadow_Layer"), #imageLiteral(resourceName: "Icon_Search_Black"), #imageLiteral(resourceName: "BG_GPS_Reguest"), #imageLiteral(resourceName: "BG-Splash-Screen1"), #imageLiteral(resourceName: "BG-Login"), #imageLiteral(resourceName: "Icon_Ok_Green"), #imageLiteral(resourceName: "Icon_Bell_Grey"), #imageLiteral(resourceName: "Icon_Forward"), #imageLiteral(resourceName: "Icon_Ok_Blue"), #imageLiteral(resourceName: "dummy_Profile_image"), #imageLiteral(resourceName: "Icon_Home_Grey"), #imageLiteral(resourceName: "dummy-Title"), #imageLiteral(resourceName: "BG_Food_Image_Shadow_Layer"),]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
   
    @IBAction func backButtonWasTapped(_ sender: Any) {
        dismissDetail()
    }
    
}

extension MenuAndPhotosVC: UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuAndPhotosVCCollectionCell", for: indexPath) as? MenuAndPhotosVCCollectionCell else {return MenuAndPhotosVCCollectionCell()}
        cell.configure(foodImage: images[indexPath.row])
       
//       cell.foodImageView =  setImageSize(index: indexPath.row, imageView: cell.foodImageView)
        
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         guard let vc = storyboard?.instantiateViewController(identifier: "PreviewVC") as? PreviewVC else {return}
               vc.modalPresentationStyle = .fullScreen
        vc.image = images[indexPath.row]
        presentDetail(vc)
       
    }
   
    
    
    func setImageSize(index: Int, imageView: UIImageView) -> UIImageView {
        let image = images[index]
         if image.size.width > UIScreen.main.bounds.width - 100 {
             imageView.frame.size.width  = (UIScreen.main.bounds.width * 2) / 3
             imageView.frame.size.height = imageView.frame.size.width
             return imageView
         } else {
             imageView.frame.size.width = (UIScreen.main.bounds.width / 4) - 5
             imageView.frame.size.height = imageView.frame.size.width
              return imageView
         }
        
    }
}

extension MenuAndPhotosVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: (width / 3 ) - 2 , height: (width / 3))
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
}


