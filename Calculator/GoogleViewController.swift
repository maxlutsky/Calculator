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


    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let googleUser = GIDSignIn.sharedInstance()?.currentUser
        nameLabel.text = googleUser?.profile.name
        emailLabel.text = googleUser?.profile.email
    }
    
    
    @IBAction func signOut(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
        guard let vc = self.presentingViewController else { return }
        vc.dismiss(animated: true, completion: nil)

    }
    
    
}
