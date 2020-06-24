//
//  ViewController.swift
//  Calculator
//
//  Created by Max on 04/03/2020.
//  Copyright © 2020 Max. All rights reserved.
//

import UIKit
//import GoogleSignIn
//import FBSDKLoginKit


class ViewController: UIViewController {
    
    let textView:UITextView = {
//        let textView = UITextView(frame: CGRect(x: 50, y: 50, width: 200, height: 50))
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text =
        "Lorem ipsum "
        textView.backgroundColor = .blue
        return textView
    }()
    
        let textView2:UITextView = {
    //        let textView = UITextView(frame: CGRect(x: 50, y: 50, width: 200, height: 50))
            let textView2 = UITextView()
            textView2.translatesAutoresizingMaskIntoConstraints = false
            textView2.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
            textView2.backgroundColor = .blue
            
            return textView2
        }()
    
    let scrollView:UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .green
        return scrollView
    }()
    
    let image:UIImageView = {
        let image = UIImageView(image: UIImage(named: "elon"))
        return image
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Launch", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.view.addSubview(textView)
        setButton()
        contraintsSetter()
        
        self.view.addSubview(scrollView)
        scrollView.anchor(top: button.bottomAnchor, paddingTop: 20, bottom: self.view.bottomAnchor, paddingBottom: 0, left: self.view.leftAnchor, paddingLeft: 0, right: self.view.rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        
        
        self.scrollView.addSubview(textView2)
//        textView2.anchor(top: scrollView.topAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: scrollView.leftAnchor, paddingLeft: 0, right: scrollView.rightAnchor, paddingRight: 0, width: 0, height: 1200)
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1400)
        
        textView2.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        textView2.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        textView2.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        textView2.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
    }
    
    func contraintsSetter(){
        textView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        textView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        
    }
    
    func setButton(){
        self.view.addSubview(button)
        button.anchor(top: textView.bottomAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: self.view.leftAnchor, paddingLeft: 20, right: self.view.rightAnchor, paddingRight: 20, width: 0, height: 40)
    }
}
