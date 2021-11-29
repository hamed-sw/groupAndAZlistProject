//
//  GalleryViewController.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 26.11.2021.
//

import UIKit

class GalleryViewController: UIViewController {
  
    

    @IBOutlet weak var activeIndicator: UIActivityIndicatorView!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var tableView: UITableView!
    var thesegment = MainViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        segment.selectedSegmentIndex = 0
        //thesegment.segmentIs = segment
        cellRegister()
        tableView.delegate = self
        tableView.dataSource = self
        segmentOn()
        navigationConfig()

    }

    func navigationConfig() {
        let appearance = UIToolbarAppearance()
        toolbar.tintColor = UIColor.AppThems.navBarTint
        toolbar.backgroundColor = UIColor.AppThems.toolBar
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.AppThems.toolBar
        UIToolbar.appearance().standardAppearance = appearance
        UIToolbar.appearance().scrollEdgeAppearance = appearance
        
        //toolbar.standardAppearance.backgroundColor = UIColor.AppThems.toolBar
        //toolbar.tintColor = .red
       // toolbar.backgroundColor = UIColor.AppThems.toolBar
    }

    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            
        }else if sender.selectedSegmentIndex == 1 {
            NotificationCenter.default.post(name: .galleryToAZListView, object: nil)
            
        } else if sender.selectedSegmentIndex == 2 {
            NotificationCenter.default.post(name: .galleryToGroupView, object: nil)
            
        }
    }
    
    private func cellRegister() {
        tableView.register(UINib(nibName: String.CellIdentifire.galleryCell, bundle: nil), forCellReuseIdentifier: String.CellIdentifire.galleryCell)
    }
    
    private func segmentOn() {
        NotificationCenter.default.addObserver(self, selector: #selector(tapped), name: .segmentGalleryOn, object: nil)
    }
    @objc func tapped() {
        segment.selectedSegmentIndex = 0
    }
}

extension GalleryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String.CellIdentifire.galleryCell, for: indexPath) as? GalleryTableViewCell else { fatalError()}
        cell.galleryLabel.text = "gallery"
        return cell
    }
    
    
}
