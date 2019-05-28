//
//  Extension.swift
//  RUsh
//
//  Created by Louis Shinohara on 5/27/19.
//  Copyright © 2019 Louis Shinohara. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
}
