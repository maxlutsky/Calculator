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
    
    let googleButtonSignIn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log in with Google", for: .normal)
        button.backgroundColor = .systemRed
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    let googleButtonSignOut: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign out from Google", for: .normal)
        button.backgroundColor = .systemRed
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    let facebookButtonSignIn: FBLoginButton = {
        let button = FBLoginButton()
        button.translatesAutoresizingMaskIntoConstraints = false
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
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        viewBuilder()
        googleButtonSignIn.addTarget(self, action: #selector(googleSignIn), for: .touchUpInside)
        googleButtonSignOut.addTarget(self, action: #selector(googleSignOut), for: .touchUpInside)

    }
    
    func viewBuilder(){
        self.view.addSubview(buttonHolder)
        self.view.addSubview(googleButtonSignOut)
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
        
        
        googleButtonSignOut.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        googleButtonSignOut.centerXAnchor.constraint(equalTo: buttonHolder.centerXAnchor).isActive = true
        googleButtonSignOut.heightAnchor.constraint(equalToConstant: 40).isActive = true
        googleButtonSignOut.widthAnchor.constraint(equalTo: buttonHolder.widthAnchor, multiplier: 9/10).isActive = true
        
        
    }
    
    
    @objc func googleSignIn(){
        let googleUser = GIDSignIn.sharedInstance()?.currentUser
        if(googleUser == nil){
            GIDSignIn.sharedInstance().signIn()
        }else{
            print(googleUser)
        }
    }
    
    @objc func googleSignOut(){
        GIDSignIn.sharedInstance().signOut()

    }
    
    
}
