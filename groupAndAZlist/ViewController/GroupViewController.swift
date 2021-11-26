//
//  GroupViewController.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 26.11.2021.
//

import UIKit

class GroupViewController: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegister()
    }

    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
    }
    
    private func cellRegister() {
        tableView.register(UINib(nibName: String.CellIdentifire.groupCell, bundle: nil), forCellReuseIdentifier: String.CellIdentifire.groupCell)
    }
    
}
