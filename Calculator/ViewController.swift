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



    @IBOutlet weak var loginButton: FBLoginButton!
    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        
        setGoogleName()
        

    }
    
    
    func setGoogleName(){
        let googleUser = GIDSignIn.sharedInstance()?.currentUser

        if googleUser != nil {
            helloLabel.text = googleUser?.profile.name
            
        } else {
            helloLabel.text = ""// present login screen here

        }
    }
    

    @IBAction func logOut(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
        setGoogleName()
    }
}



