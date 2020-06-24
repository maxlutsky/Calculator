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
    
    @IBOutlet weak var loginButton: FBLoginButton!
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
        loginButton.permissions = ["public_profile", "email"]
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
    
    @IBAction func test(_ sender: Any) {
        guard let accessToken = FBSDKLoginKit.AccessToken.current else { return }
        let graphRequest = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                                      parameters: ["fields": "name, email"],
                                                      tokenString: accessToken.tokenString,
                                                      version: nil,
                                                      httpMethod: .get)
        graphRequest.start { (connection, result, error) -> Void in
            if error == nil {
                print("result \(result)")
            }
            else {
                print("error \(error)")
            }
        }
    }
}
