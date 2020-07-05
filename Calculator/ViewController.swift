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
            let googleUser = GIDSignIn.sharedInstance()?.currentUser
            let user = User(name: googleUser?.profile.name ?? "", email: googleUser?.profile.email ?? "")
            openInfoPage(user: user)
        }else{

        }
    }
    
    let googleButtonSignIn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log in with Google", for: .normal)
        button.backgroundColor = .systemRed
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()

    let facebookButtonSignIn: FBLoginButton = {
        let button = FBLoginButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        return button
    }()
    
    let buttonHolder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .darkGray
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        viewBuilder()
        googleButtonSignIn.addTarget(self, action: #selector(googleSignIn), for: .touchUpInside)
    }
    
    func viewBuilder(){
        self.view.addSubview(buttonHolder)
        buttonHolder.addSubview(facebookButtonSignIn)
        buttonHolder.addSubview(googleButtonSignIn)
        
        buttonHolder.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        buttonHolder.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        buttonHolder.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 9/10).isActive = true
        
        googleButtonSignIn.topAnchor.constraint(equalTo: buttonHolder.topAnchor, constant: 20).isActive = true
        googleButtonSignIn.centerXAnchor.constraint(equalTo: buttonHolder.centerXAnchor).isActive = true
        googleButtonSignIn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        googleButtonSignIn.widthAnchor.constraint(equalTo: buttonHolder.widthAnchor, multiplier: 9/10).isActive = true
        
        facebookButtonSignIn.topAnchor.constraint(equalTo: googleButtonSignIn.bottomAnchor, constant: 10).isActive = true
        facebookButtonSignIn.centerXAnchor.constraint(equalTo: buttonHolder.centerXAnchor).isActive = true
        facebookButtonSignIn.widthAnchor.constraint(equalTo: buttonHolder.widthAnchor, multiplier: 9/10).isActive = true
        facebookButtonSignIn.bottomAnchor.constraint(equalTo: buttonHolder.bottomAnchor, constant: -20).isActive = true
    }
    
    func openInfoPage(user: User){
        let GoogleVC = InfoViewController()
        GoogleVC.setupData(name: user.name, id: user.email)
        GoogleVC.modalPresentationStyle = .fullScreen
        present(GoogleVC, animated: true, completion: nil)
    }
    
    func requestFacebookData(){
        facebookButtonSignIn.permissions = ["public_profile", "email"]
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
    
    @objc func googleSignIn(){
        let googleUser = GIDSignIn.sharedInstance()?.currentUser
        let user = User(name: googleUser?.profile.name ?? "", email: googleUser?.profile.email ?? "")
        if(googleUser == nil){
            GIDSignIn.sharedInstance().signIn()
        }else{
            openInfoPage(user: user)
        }
    }
    
    
}

