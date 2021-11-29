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
    lazy var grouViewModel = GroupListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        grouViewModel.fetchData()
       // grouViewModel.groupArryData
        print(grouViewModel.groupArryData)
        viewModel.indicatorUIView = self.activeView
        viewModel.activeIndacater = self.activeIndicator
        startActivindicator()
        viewModel.tableView = self.tableView
        viewModel.getdatafromDatabase()
        cellRegister()
        tableView.delegate = self
        tableView.dataSource = self
        // this is for space between section
        tableView.sectionHeaderTopPadding = 3
        

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
        tableView.register(HeaderTabelView.self, forHeaderFooterViewReuseIdentifier: String.CellIdentifire.headerIdentifier)
    }
    private func segmentOn() {
        NotificationCenter.default.addObserver(self, selector: #selector(tapped), name: .segmentGroupOn, object: nil)
    }
    @objc func tapped() {
        segment.selectedSegmentIndex = 2
    }
    
}

extension GroupViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return grouViewModel.groupArryData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if grouViewModel.groupArryData[section].isActive == true {
            return grouViewModel.groupArryData[section].section.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String.CellIdentifire.groupCell, for: indexPath) as? GroupTableViewCell else { fatalError()}
        let data = grouViewModel.groupArryData[indexPath.section].section[indexPath.row]
        cell.config(data: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: String.CellIdentifire.headerIdentifier) as? HeaderTabelView
        header?.button.addTarget(self, action: #selector(sectionTapped), for: .touchUpInside)
        header?.button.tag = section
       
        
        if grouViewModel.groupArryData[section].isActive == false {
            header?.image.image = UIImage(systemName: "chevron.forward")
        }else {
            header?.image.image = UIImage(systemName: "chevron.down")
        }
        header?.label.text = grouViewModel.groupArryData[section].mediaType
        return header
    }
    @objc func sectionTapped(button:UIButton) {
        if grouViewModel.groupArryData[button.tag].isActive == true {
            grouViewModel.groupArryData[button.tag].isActive = false
            tableView.reloadSections(IndexSet(integer: button.tag), with: .fade)
         
        } else {
            grouViewModel.groupArryData[button.tag].isActive = true
            tableView.reloadSections(IndexSet(integer: button.tag), with: .fade)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    
}
