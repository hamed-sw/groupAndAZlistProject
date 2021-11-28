//
//  GroupViewController.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 26.11.2021.
//

import UIKit

class GroupViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var activeView: UIView!
    @IBOutlet weak var activeIndicator: UIActivityIndicatorView!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var tableView: UITableView!
    var thesegment = MainViewController()
    lazy var viewModel = AZlistAndGroupViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.indicatorUIView = self.activeView
        viewModel.activeIndacater = self.activeIndicator
        startActivindicator()
        viewModel.tableView = self.tableView
        viewModel.getdatafromDatabase()
        cellRegister()
        tableView.delegate = self
        tableView.dataSource = self

    }
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViewAndIndicator()
        jsonUpdate()
        segmentOn()
        navigationConfig()

    }
    func jsonUpdate() {
        viewModel.getData()
    }
    
    func navigationConfig() {
        let appearance = UIToolbarAppearance()
        toolBar.tintColor = UIColor.AppThems.navBarTint
        toolBar.backgroundColor = UIColor.AppThems.toolBar
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.AppThems.toolBar
        UIToolbar.appearance().standardAppearance = appearance
        UIToolbar.appearance().scrollEdgeAppearance = appearance
        
        //toolbar.standardAppearance.backgroundColor = UIColor.AppThems.toolBar
        //toolbar.tintColor = .red
       // toolbar.backgroundColor = UIColor.AppThems.toolBar
    }
    func updateViewAndIndicator() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.activeView.isHidden = true
            self.activeIndicator.stopAnimating()
            self.activeIndicator.hidesWhenStopped = true
        }
    }
  
   
    func startActivindicator() {
        viewModel.startActiveIndicater()
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
        return viewModel.nasaDara.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String.CellIdentifire.groupCell, for: indexPath) as? GroupTableViewCell else { fatalError()}
        let data = viewModel.nasaDara[indexPath.row]
        cell.config(data: data)
        return cell
    }
    
    
}
