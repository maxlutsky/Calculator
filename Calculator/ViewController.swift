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


class ViewController: UIViewController, GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if(error == nil){
            print(user)
            openGooglePage()
        }else{
            print(error)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }
    
    @IBAction func signInWithGoogle(_ sender: Any) {
        let googleUser = GIDSignIn.sharedInstance()?.currentUser
        if(googleUser == nil){
            GIDSignIn.sharedInstance().signIn()
        }else{
            openGooglePage()
        }
    }
    
    func openGooglePage(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let googleVC = storyboard.instantiateViewController(withIdentifier: "GoogleViewController")
        self.present(googleVC, animated: true, completion: nil)
    }
}
