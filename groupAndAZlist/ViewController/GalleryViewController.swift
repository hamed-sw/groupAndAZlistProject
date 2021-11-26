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

    }
    

    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
    }
    
    private func cellRegister() {
        tableView.register(UINib(nibName: String.CellIdentifire.galleryCell, bundle: nil), forCellReuseIdentifier: String.CellIdentifire.galleryCell)
    }
}
