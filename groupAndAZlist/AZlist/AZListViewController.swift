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
    let db = Database()


    var thesegment = MainViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        db.dbMethod()
        print(fileUrl)
        viewModel.indicatorUIView = self.activeView
        viewModel.activeIndacater = self.activeIndicatior
        viewModel.startActiveIndicater()
        viewModel.tableView = self.tableView
        viewModel.getdatafromDatabase()
       // jsonUpdate()
        cellRegister()
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViewAndIndicator()
        segmentOn()
        viewModel.aZlistModel()
        navigationConfig()

    }
//    func jsonUpdate() {
//        viewModel.getData()
//    }
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
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor(red: 238/255, green: 236/255, blue: 201/255, alpha: 1)

        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: .light)
        header.textLabel?.textColor = UIColor.black

    }
    
    
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {

        return viewModel.userSection
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.userSection.count
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return viewModel.userSection[section].uppercased()
    }
    
  
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let userKey = viewModel.userSection[section]
        if let user = viewModel.azLisDic[userKey] {
            return user.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String.CellIdentifire.azlistCell, for: indexPath) as? AZListTableViewCell else { fatalError()}
        let userKey = viewModel.userSection[indexPath.section]
        if let user = viewModel.azLisDic[userKey.uppercased()] {
            let theuser = user[indexPath.row]
            cell.configar(data: theuser)
        }
       // let datas = viewModel.nasaDara[indexPath.row]

      //  cell.configar(data: datas)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detail = storyBoard.instantiateViewController(withIdentifier: String.StoryBoardIdentity.detailVC) as? DetailViewController else { fatalError()}
        let userkey = viewModel.userSection[indexPath.section]
        if let user = viewModel.azLisDic[userkey.uppercased()] {
            let id = user[indexPath.row].id
            detail.custoninit(id: id)
        }
        if UIDevice.current.userInterfaceIdiom == .phone {
            navigationController?.pushViewController(detail, animated: true)
        } else {
        splitViewController?.showDetailViewController(detail, sender: nil)
        }
    }
    
}
