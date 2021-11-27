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
        tableView.delegate = self
        tableView.dataSource = self
        segmentOn()
    }
 

    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            NotificationCenter.default.post(name: .groupToGalleryView, object: nil)
            
        }else if sender.selectedSegmentIndex == 1 {
            NotificationCenter.default.post(name: .groupToAZlistView, object: nil)
            
        } else if sender.selectedSegmentIndex == 2 {
            
        }
    }
    
    private func cellRegister() {
        tableView.register(UINib(nibName: String.CellIdentifire.groupCell, bundle: nil), forCellReuseIdentifier: String.CellIdentifire.groupCell)
    }
    private func segmentOn() {
        NotificationCenter.default.addObserver(self, selector: #selector(tapped), name: .segmentGroupOn, object: nil)
    }
    @objc func tapped() {
        segment.selectedSegmentIndex = 2
    }
    
}

extension GroupViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String.CellIdentifire.groupCell, for: indexPath) as? GroupTableViewCell else { fatalError()}
        cell.groupLabel.text = "group"
        return cell
    }
    
    
}
