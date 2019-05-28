//
//  ViewController.swift
//  RUsh
//
//  Created by Louis Shinohara on 5/26/19.
//  Copyright © 2019 Louis Shinohara. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {

    
    @IBOutlet weak var otpTcx: UITextField!
    @IBOutlet weak var phoneOu: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }

    @IBAction func phoneSignIn(_ sender: Any) {
        
        guard let phoneNumber = phoneOu.text else { return }
        
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) {(verificationId,error) in
            if error == nil {
                print(verificationId)
            } else {
                print("Unable to get Secret Verification Code from firebase",error?.localizedDescription)
            }
    }
    }
    
    
    @IBAction func verifyOtp(_ sender: Any) {
    }
    
}

