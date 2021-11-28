//
//  AZListViewController.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 26.11.2021.
//

import UIKit

class AZListViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var activeView: UIView!
    @IBOutlet weak var activeIndicatior: UIActivityIndicatorView!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var tableView: UITableView!
    lazy var viewModel = AZlistAndGroupViewModel()

    var thesegment = MainViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.indicatorUIView = self.activeView
        viewModel.activeIndacater = self.activeIndicatior
        viewModel.startActiveIndicater()
        viewModel.tableView = self.tableView
        jsonUpdate()
        cellRegister()
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViewAndIndicator()
        segmentOn()
        viewModel.aZlistModel()

    }
    func jsonUpdate() {
        viewModel.getData()
    }
  
    func updateViewAndIndicator() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.activeView.isHidden = true
            self.activeIndicatior.stopAnimating()
            self.activeIndicatior.hidesWhenStopped = true
        }
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
    
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        view.tintColor = UIColor(red: 238/255, green: 236/255, blue: 201/255, alpha: 1)
//
//        let header = view as! UITableViewHeaderFooterView
//        header.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: .light)
//        header.textLabel?.textColor = UIColor.black
//
//    }
    
    
    
//    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//        if isActive {
//        return viewModel.userSections
//        }else {
//            return nil
//        }
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        if isActive {
//            return viewModel.userSections.count
//        } else {
//            return 1
//        }
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if isActive {
//        return viewModel.userSections[section].uppercased()
//        }
//        else {
//            return nil
//        }
//    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.nasaDara.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String.CellIdentifire.azlistCell, for: indexPath) as? AZListTableViewCell else { fatalError()}
        let data = viewModel.nasaDara[indexPath.row]
        //cell.azImage.image = UIImage(named: viewModel.nasaDara[indexPath.row].url)
        
       // cell.titleLabel.text = viewModel.nasaDara[indexPath.row].title
        cell.configar(data: data)
        return cell
    }
    
}
