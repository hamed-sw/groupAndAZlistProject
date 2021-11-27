//
//  UIColor.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 26.11.2021.
//

import UIKit

extension UIColor {
    struct AppThems {
        // Branding
        static var brand: UIColor { return UIColor(named: "Brand") ?? UIColor()}
        
        //NavBar
        static var navBar: UIColor { return UIColor(named: "NavBar") ?? UIColor()}
        static var navBarTint: UIColor { return UIColor(named: "NavBarTint") ?? UIColor()}
        static var toolBar: UIColor { return UIColor(named: "ToolBar") ?? UIColor()}
    }
}
