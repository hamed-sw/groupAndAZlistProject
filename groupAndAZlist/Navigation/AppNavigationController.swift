//
//  AppNavigationController.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 26.11.2021.
//

import UIKit

class AppNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.AppThems.navBarTint]
        self.navigationBar.tintColor = UIColor.AppThems.navBarTint
        self.navigationBar.barTintColor = UIColor.AppThems.navBar
    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
