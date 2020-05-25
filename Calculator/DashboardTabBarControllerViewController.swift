//
//  DashboardTabBarControllerViewController.swift
//  Calculator
//
//  Created by Max on 25/05/2020.
//  Copyright © 2020 Max. All rights reserved.
//

import UIKit

class DashboardTabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let downloadViewController = Item1ViewController()
        downloadViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 0)
        let bookmarkViewController = ViewController()
        bookmarkViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)

        let viewControllerList = [ downloadViewController, bookmarkViewController ]
        viewControllers = viewControllerList
    }

    //Delegate methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true;
    }
}
