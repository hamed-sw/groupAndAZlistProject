//
//  GallerymainViewController.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 30.11.2021.
//

import UIKit

class GallerymainViewController: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var toolbar: UIToolbar!
    var thesegment = MainViewController()
    lazy var viewModel = GalleryViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        navigationConfig()
        cellRegister()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            
        }else if sender.selectedSegmentIndex == 1 {
            NotificationCenter.default.post(name: .galleryToAZListView, object: nil)
            
        } else if sender.selectedSegmentIndex == 2 {
            NotificationCenter.default.post(name: .galleryToGroupView, object: nil)
            
        }
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
   

    private func cellRegister() {
        collectionView.register(UINib(nibName: String.CellIdentifire.galleryMainCell, bundle: nil), forCellWithReuseIdentifier: String.CellIdentifire.galleryMainCell)
    }
    
    private func segmentOn() {
        NotificationCenter.default.addObserver(self, selector: #selector(tapped), name: .segmentGalleryOn, object: nil)
    }
    @objc func tapped() {
        segment.selectedSegmentIndex = 0
    }
}

extension GallerymainViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.galleryitem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String.CellIdentifire.galleryMainCell, for: indexPath) as! GallerymainCollectionViewCell
        let theitme = viewModel.galleryitem[indexPath.row]

        cell.configer(item: theitme)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 410, height: 197)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: String.StoryBoardIdentity.SubGallerVC) as? SubGalleryViewController else { fatalError()}
        //let item = viewModel.item.value![indexPath.row]
        let theitem = viewModel.galleryitem[indexPath.row]
        switch (theitem.action) {
        case .ImageGallery:
            vc.custominit(intex: 0)
            vc.image = UIImage(named: theitem.image)
            if UIDevice.current.userInterfaceIdiom == .phone {
                navigationController?.pushViewController(vc, animated: true)
            } else {
                NotificationCenter.default.post(name: .ipadCallSubgallery, object: nil)
                splitViewController?.showDetailViewController(vc, sender: nil)
                
            }
        case .VideoGallery:
            vc.custominit(intex: 1)
            vc.image = UIImage(named: theitem.image)
            if UIDevice.current.userInterfaceIdiom == .phone {
                navigationController?.pushViewController(vc, animated: true)
            } else {
                NotificationCenter.default.post(name: .ipadCallSubgallery, object: nil)
                splitViewController?.showDetailViewController(vc, sender: nil)
            }
            
        }
    }
}


