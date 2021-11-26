//
//  MainViewController.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 26.11.2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var galleryView: UIView!
    @IBOutlet weak var azlistView: UIView!
    @IBOutlet weak var groupView: UIView!
    @IBOutlet weak var aZlistIpadVIew: UIView!
    @IBOutlet weak var groupIpadView: UIView!
    
    let one:Int = 1
    let zero:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        reload()


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    

    
    func reload() {
        configerUIView(first:one, second: zero, third: zero, fourth: zero, fifth: zero)
    }
    
    func configerUIView(first: Int, second: Int, third: Int, fourth: Int, fifth: Int) {
        galleryView.alpha    = CGFloat(first)
        azlistView.alpha     = CGFloat(second)
        groupView.alpha      = CGFloat(third)
        aZlistIpadVIew.alpha = CGFloat(fourth)
        groupIpadView.alpha  = CGFloat(fifth)
        
    }

}
