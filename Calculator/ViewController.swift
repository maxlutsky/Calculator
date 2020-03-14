//
//  ViewController.swift
//  Calculator
//
//  Created by Max on 04/03/2020.
//  Copyright © 2020 Max. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textFieldOne: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
//        showUiImage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        print("Test button")
        
        let vc = newVC()
        
//        navigationController?.pushViewController(vc, animated: true)
        
        
        
//        self.presentingViewController(vc)
    
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true, completion: nil)
        
        
//        let vc = UIViewController()
//        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
//        self.present(vc, animated: true, completion: nil)
        
    }
    
//    func showUiImage() {
//
//        defer {
//            print("last element")
//        }
//
//        view.backgroundColor = UIColor.red
//
//        var testvalueOptional: String? = "asdasd"
//
////        1
//        testvalueOptional = textFieldOne.text!
////        print("Test hjkhjkhjkh")
//
//
//        var a: String? = nil
////        2
//        guard let somevalue = a else {
////            print("before return")
//            return
////            print("after return")
//        }
//        print(somevalue)
////        print("не виконалось ")
//
//
////        3
//        if let testvalue = textFieldOne.text {
//            print(testvalue)
//        }
////        print("Test asdasdasd")
////        4
//        let noNilValue: String = textFieldOne.text ?? ""
//
//    }
    
    
    
    
}



//
//   https://stackoverflow.com/questions/56435510/presenting-modal-in-ios-13-fullscreen
