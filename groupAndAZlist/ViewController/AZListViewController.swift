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
    lazy var viewModel = AZlistAndGroupViewModel()

    var thesegment = MainViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.tableView = self.tableView
        jsonUpdate()
        cellRegister()
        tableView.delegate = self
        tableView.dataSource = self
        print(viewModel.nasaDara.count)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        segmentOn()

    }
    func jsonUpdate() {
        viewModel.getData()
    }
  
    
    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            NotificationCenter.default.post(name: .aZlistToGalleryview, object: nil)
            
        }else if sender.selectedSegmentIndex == 1 {
            
        } else if sender.selectedSegmentIndex == 2 {
            NotificationCenter.default.post(name: .aZlistToGroupview, object: nil)
            
        }

    }
    
    private func cellRegister() {
        tableView.register(UINib(nibName: String.CellIdentifire.azlistCell, bundle: nil), forCellReuseIdentifier: String.CellIdentifire.azlistCell)
    }
    private func segmentOn() {
        NotificationCenter.default.addObserver(self, selector: #selector(tapped), name: .segmentAZlsitOn, object: nil)
    }
    @objc func tapped() {
        segment.selectedSegmentIndex = 1
    }

}

extension AZListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.nasaDara.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String.CellIdentifire.azlistCell, for: indexPath) as? AZListTableViewCell else { fatalError()}
        //cell.azImage.image = UIImage(named: viewModel.nasaDara[indexPath.row].url)
        cell.titleLabel.text = viewModel.nasaDara[indexPath.row].title
        return cell
    }
    
}
