//
//  GoogleViewController.swift
//  Calculator
//
//  Created by Max on 04/03/2020.
//  Copyright © 2020 Max. All rights reserved.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit


class GoogleViewController: UIViewController {
    
    let googleButtonSignOut: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign out from Google", for: .normal)
        button.backgroundColor = .systemRed
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .darkGray
        viewBuilder()
        googleButtonSignOut.addTarget(self, action: #selector(googleSignOut), for: .touchUpInside)
//        let googleUser = GIDSignIn.sharedInstance()?.currentUser
//        nameLabel.text = googleUser?.profile.name
//        emailLabel.text = googleUser?.profile.email
    }
    
    func setupData(name: String?, id:String?){
        nameLabel.text = name ?? ""
        emailLabel.text = id ?? ""
    }
    
    func viewBuilder(){
        self.view.addSubview(googleButtonSignOut)
        self.view.addSubview(nameLabel)
        self.view.addSubview(emailLabel)
        
        nameLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 9/10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        emailLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 90).isActive = true
        emailLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 9/10).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        emailLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        googleButtonSignOut.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -120).isActive = true
        googleButtonSignOut.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        googleButtonSignOut.heightAnchor.constraint(equalToConstant: 40).isActive = true
        googleButtonSignOut.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 9/10).isActive = true
    }
    
    @objc func googleSignOut(){
        GIDSignIn.sharedInstance().signOut()
        guard let vc = self.presentingViewController else { return }
        vc.dismiss(animated: true, completion: nil)
    }
    
}
