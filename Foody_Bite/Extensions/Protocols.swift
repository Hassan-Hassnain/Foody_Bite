//
//  Protocols.swift
//  Foody_Bite
//
//  Created by Usama Sadiq on 3/11/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

//For ProfileVC_TableCell option button
protocol OptionButtonDelegate {
    func didTappedOptionButton()
}

//For ProfileVC CustionAlertOptions
protocol CustomAlertOptionsDelegate {
    func editButtonClicked()
    func deleteButtonClicked()
    func cancelButtonClicked()
}
