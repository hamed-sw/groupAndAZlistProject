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
        galleryToAZlistView()
        galleryToGroupView()
        aZlistToGallery()
        azListToGroupView()
        groupToGalleryview()
        groupToAzlistview()
        
    }
    /////////////////
    private func galleryToAZlistView() {
        NotificationCenter.default.addObserver(self, selector: #selector(galleryToAz), name: .galleryToAZListView, object: nil)
        
    }
    @objc func galleryToAz() {
        NotificationCenter.default.post(name: .segmentAZlsitOn, object: nil)
        if (UIDevice.current.userInterfaceIdiom == .phone) {
            configerUIView(first: zero, second: one, third: zero, fourth: zero, fifth: zero)
        } else if (UIDevice.current.userInterfaceIdiom == .pad) {
            configerUIView(first: zero, second: zero, third: zero, fourth: one, fifth: zero)
            NotificationCenter.default.post(name: .navigationHide, object: nil)
        }
    }
    ///////////////////
    private func galleryToGroupView() {
        NotificationCenter.default.addObserver(self, selector: #selector(gallerytogroup), name: .galleryToGroupView, object: nil)
    }
    @objc func gallerytogroup() {
        NotificationCenter.default.post(name: .segmentGroupOn, object: nil)
        if (UIDevice.current.userInterfaceIdiom == .phone) {
            configerUIView(first: zero, second: zero, third: one, fourth: zero, fifth: zero)
        } else if (UIDevice.current.userInterfaceIdiom == .pad) {
            configerUIView(first: zero, second: zero, third: zero, fourth: zero, fifth: one)
            NotificationCenter.default.post(name: .navigationHide, object: nil)
        }

    }
    ////////////////////////////
    private func aZlistToGallery() {
        NotificationCenter.default.addObserver(self, selector: #selector(azlistToGaller), name: .aZlistToGalleryview, object: nil)
    }
    @objc func azlistToGaller() {
        configerUIView(first: one, second: zero, third: zero, fourth: zero, fifth: zero)
        NotificationCenter.default.post(name: .segmentGalleryOn, object: nil)
        NotificationCenter.default.post(name: .enableNavigation, object: nil)
        
    }
    ////////////////
    private func azListToGroupView() {
        NotificationCenter.default.addObserver(self, selector: #selector(azListToGroup), name: .aZlistToGroupview, object: nil)
    }
    @objc func azListToGroup() {
        NotificationCenter.default.post(name: .segmentGroupOn, object: nil)
        if (UIDevice.current.userInterfaceIdiom == .phone) {
            configerUIView(first: zero, second: zero, third: one, fourth: zero, fifth: zero)
        } else if (UIDevice.current.userInterfaceIdiom == .pad) {
            configerUIView(first: zero, second: zero, third: zero, fourth: zero, fifth: one)
            NotificationCenter.default.post(name: .navigationHide, object: nil)
        }
    }
/////////////////////////
    private func groupToGalleryview() {
        NotificationCenter.default.addObserver(self, selector: #selector(groupToGallery), name: .groupToGalleryView, object: nil)
    }
    @objc func groupToGallery() {
       configerUIView(first: one, second: zero, third: zero, fourth: zero, fifth: zero)
        NotificationCenter.default.post(name: .segmentGalleryOn, object: nil)
        NotificationCenter.default.post(name: .enableNavigation, object: nil)
    }
///////////////////
    private func groupToAzlistview() {
        NotificationCenter.default.addObserver(self, selector: #selector(groupToAzlist), name: .groupToAZlistView, object: nil)
    }
    @objc func groupToAzlist() {
        NotificationCenter.default.post(name: .segmentAZlsitOn, object: nil)
        if (UIDevice.current.userInterfaceIdiom == .phone) {
            configerUIView(first: zero, second: one, third: zero, fourth: zero, fifth: zero)
        } else if (UIDevice.current.userInterfaceIdiom == .pad) {
            configerUIView(first: zero, second: zero, third: zero, fourth: one, fifth: zero)
            NotificationCenter.default.post(name: .navigationHide, object: nil)
        }
    }
    

    
    func reload() {
        configerUIView(first:one, second: zero, third: zero, fourth: zero, fifth: zero)
        NotificationCenter.default.post(name: .segmentGalleryOn, object: nil)

    }
    
    func configerUIView(first: Int, second: Int, third: Int, fourth: Int, fifth: Int) {
        galleryView.alpha    = CGFloat(first)
        azlistView.alpha     = CGFloat(second)
        groupView.alpha      = CGFloat(third)
        aZlistIpadVIew.alpha = CGFloat(fourth)
        groupIpadView.alpha  = CGFloat(fifth)
        
    }

}
