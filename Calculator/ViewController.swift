//
//  ViewController.swift
//  Calculator
//
//  Created by Max on 04/03/2020.
//  Copyright © 2020 Max. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    
    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number2: UITextField!
    
    @IBOutlet weak var displayText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//    @IBAction func firstField(_ sender: Any) {
//              let a  = number1.text!
//              let b  = number2.text!
//              
//              let sum = Int(a)! + Int(b)!
//              
//              
//        
//              displayText.text = String(sum)
//    }
//    @IBAction func secondField(_ sender: Any) {
//              let a  = number1.text!
//              let b  = number2.text!
//              
//              let sum = Int(a)! + Int(b)!
//              
//              
//        
//              displayText.text = String(sum)
//    }
    @IBAction func button(_ sender: Any) {
                let a  = number1.text!
                let b  = number2.text!
                
                let sum = Int(a)! + Int(b)!
                
                
          
                displayText.text = String(sum)
                
    }

    
    
    
}



