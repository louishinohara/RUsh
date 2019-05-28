//
//  ViewController.swift
//  RUsh
//
//  Created by Louis Shinohara on 5/26/19.
//  Copyright © 2019 Louis Shinohara. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
class ViewController: UIViewController, GIDSignInUIDelegate  {
    

    
    @IBOutlet weak var otpTcx: UITextField!
    @IBOutlet weak var phoneOu: UITextField!
    
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        //hideKeyboardWhenTappedAround USED FOR PHONE NUMBER AUTHENTICATION. DOESNT WORK WITH GOOGLE
        
    }

    @IBAction func phoneSignIn(_ sender: Any) {
        
        guard let phoneNumber = phoneOu.text else { return }
        
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) {(verificationId,error) in
            if error == nil {
                print(verificationId)
                guard let verifyId = verificationId else { return }
                self.userDefault.set(verifyId,forKey:"verificationId")
                self.userDefault.synchronize()
            } else {
                print("Unable to get Secret Verification Code from firebase",error?.localizedDescription)
            }
    }
    }
    
    @IBAction func verifyOtpPressed(_ sender: Any) {
        
        guard let otpCode = otpTcx.text else { return }
        
        guard let verificationId = userDefault.string(forKey: "verificationId") else { return }
        
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationId, verificationCode: otpCode)
        
        Auth.auth().signInAndRetrieveData(with: credential) {(success, error) in
            if error == nil {
                print(success)
                print("User Signed in...")
                
            } else {
                print("Something went wrong... \(error?.localizedDescription)")
            }
        }
        
    }
}
    


// Gotta figure out how to fix tap around in viewdidload to work with google sign in
// Need a segue for log out button.
// Need to add the thing which enables users to sign out and sign in with a different email
// Stay signed in after inputting
