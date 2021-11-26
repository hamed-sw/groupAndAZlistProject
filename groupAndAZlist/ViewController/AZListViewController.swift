//
//  AZListViewController.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 26.11.2021.
//

import UIKit

class AZListViewController: UIViewController {

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
        tableView.register(UINib(nibName: String.CellIdentifire.azlistCell, bundle: nil), forCellReuseIdentifier: String.CellIdentifire.azlistCell)
    }
    

}
