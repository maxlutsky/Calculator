//
//  ViewController.swift
//  Calculator
//
//  Created by Max on 04/03/2020.
//  Copyright © 2020 Max. All rights reserved.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit


class ViewController: UIViewController {




    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        
        

    }
    
    

    @IBAction func signInWithGoogle(_ sender: Any) {
        let googleUser = GIDSignIn.sharedInstance()?.currentUser
        let GoogleVC = storyboard?.instantiateViewController(identifier: "GoogleViewController") as! GoogleViewController
        if googleUser != nil {
            navigationController?.pushViewController(GoogleVC, animated: true)

        } else {
            GIDSignIn.sharedInstance().signIn()
            navigationController?.pushViewController(GoogleVC, animated: true)
        }
    }
    
}



