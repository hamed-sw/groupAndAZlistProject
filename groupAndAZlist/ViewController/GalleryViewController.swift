//
//  GalleryViewController.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 26.11.2021.
//

import UIKit

class GalleryViewController: UIViewController {
  
    

    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegister()
        tableView.delegate = self
        tableView.dataSource = self
        segmentOn()

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
