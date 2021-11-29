//
//  GalleryViewController.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 26.11.2021.
//

import UIKit

class GalleryViewController: UIViewController {
  
    

    @IBOutlet weak var activeIndicator: UIActivityIndicatorView!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var tableView: UITableView!
    var thesegment = MainViewController()
    lazy var viewModel = GalleryViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        segment.selectedSegmentIndex = 0
        //thesegment.segmentIs = segment
        cellRegister()
        tableView.delegate = self
        tableView.dataSource = self
        segmentOn()
        navigationConfig()
        startActiveIndicator()
        updateViewAndIndicator()

    }

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

    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            
        }else if sender.selectedSegmentIndex == 1 {
            NotificationCenter.default.post(name: .galleryToAZListView, object: nil)
            
        } else if sender.selectedSegmentIndex == 2 {
            NotificationCenter.default.post(name: .galleryToGroupView, object: nil)
            
        }
    }
    func updateViewAndIndicator() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.activeIndicator.stopAnimating()
            self.activeIndicator.hidesWhenStopped = true
        }
    }
    func startActiveIndicator() {
        activeIndicator.startAnimating()
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
        return viewModel.item.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String.CellIdentifire.galleryCell, for: indexPath) as? GalleryTableViewCell else { fatalError()}
        let item = viewModel.item.value![indexPath.row]
        cell.configer(item: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SubGalleryViewController") as? SubGalleryViewController else { fatalError()}
        let item = viewModel.item.value![indexPath.row]
        switch (item.action) {
        case .ImageGallery:
            vc.custominit(intex: 0)
            self.navigationController?.pushViewController(vc, animated: true)
        case .VideoGallery:
            vc.custominit(intex: 1)
            self.navigationController?.pushViewController(vc, animated: true)
        
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cellHeight:CGFloat = CGFloat()

        if UIDevice.current.userInterfaceIdiom == .phone {
               cellHeight = 300
           }
           else  {
               cellHeight = 400
           }
           return cellHeight
        
    }
    
    
}
