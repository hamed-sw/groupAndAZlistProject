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
    var segmentIs = UISegmentedControl()
    
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
            configerUIView(first: .zeroAlph, second: .oneAlph, third: .zeroAlph, fourth: .zeroAlph, fifth: .zeroAlph)
        } else if (UIDevice.current.userInterfaceIdiom == .pad) {
            configerUIView(first: .zeroAlph, second: .zeroAlph, third: .zeroAlph, fourth: .oneAlph, fifth: .zeroAlph)
            segmentIs.selectedSegmentIndex = 1
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
            configerUIView(first: .zeroAlph, second: .zeroAlph, third: .oneAlph, fourth: .zeroAlph, fifth: .zeroAlph)
        } else if (UIDevice.current.userInterfaceIdiom == .pad) {
            configerUIView(first: .zeroAlph, second: .zeroAlph, third: .zeroAlph, fourth: .zeroAlph, fifth: .oneAlph)
            segmentIs.selectedSegmentIndex = 2
            NotificationCenter.default.post(name: .navigationHide, object: nil)
        }

    }
    ////////////////////////////
    private func aZlistToGallery() {
        NotificationCenter.default.addObserver(self, selector: #selector(azlistToGaller), name: .aZlistToGalleryview, object: nil)
    }
    @objc func azlistToGaller() {
        configerUIView(first: .oneAlph, second: .zeroAlph, third: .zeroAlph, fourth: .zeroAlph, fifth: .zeroAlph)
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
            configerUIView(first: .zeroAlph, second: .zeroAlph, third: .oneAlph, fourth: .zeroAlph, fifth: .zeroAlph)
        } else if (UIDevice.current.userInterfaceIdiom == .pad) {
            configerUIView(first: .zeroAlph, second: .zeroAlph, third: .zeroAlph, fourth: .zeroAlph, fifth: .oneAlph)
            segmentIs.selectedSegmentIndex = 2
            NotificationCenter.default.post(name: .navigationHide, object: nil)
        }
    }
/////////////////////////
    private func groupToGalleryview() {
        NotificationCenter.default.addObserver(self, selector: #selector(groupToGallery), name: .groupToGalleryView, object: nil)
    }
    @objc func groupToGallery() {
        configerUIView(first: .oneAlph, second: .zeroAlph, third: .zeroAlph, fourth: .zeroAlph, fifth: .zeroAlph)
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
            configerUIView(first: .zeroAlph, second: .oneAlph, third: .zeroAlph, fourth: .zeroAlph, fifth: .zeroAlph)
        } else if (UIDevice.current.userInterfaceIdiom == .pad) {
            configerUIView(first: .zeroAlph, second: .zeroAlph, third: .zeroAlph, fourth: .oneAlph, fifth: .zeroAlph)
            segmentIs.selectedSegmentIndex = 1
            NotificationCenter.default.post(name: .navigationHide, object: nil)
        }
    }
    

    
    func reload() {
        configerUIView(first:.oneAlph, second: .zeroAlph, third: .zeroAlph, fourth: .zeroAlph, fifth: .zeroAlph)
        NotificationCenter.default.post(name: .segmentGalleryOn, object: nil)

    }
    
    func configerUIView(first: CGFloat, second: CGFloat, third: CGFloat, fourth: CGFloat, fifth: CGFloat) {
        galleryView.alpha    = first
        azlistView.alpha     = second
        groupView.alpha      = third
        aZlistIpadVIew.alpha = fourth
        groupIpadView.alpha  = fifth
        
    }

}
