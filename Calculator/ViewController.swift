//
//  ViewController.swift
//  Calculator
//
//  Created by Max on 04/03/2020.
//  Copyright © 2020 Max. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {


    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self

        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        // Do any additional setup after loading the view.
        
        let googleUser = GIDSignIn.sharedInstance()?.currentUser

        if googleUser != nil {
            helloLabel.text = googleUser?.profile.name
            
        } else {
        // present login screen here

        }
    }

    
}


