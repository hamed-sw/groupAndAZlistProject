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
        self.navigationBar.isTranslucent = false
        if #available(iOS 15.0, *) {
            self.navigationBar.backgroundColor = UIColor.AppThems.navBar
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .systemGray
            //UIColor.AppThems.navBar
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
        
    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
