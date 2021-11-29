//
//  SubGalleryViewController.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 29.11.2021.
//

import UIKit

class SubGalleryViewController: UIViewController {

    @IBOutlet weak var activeIndicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    lazy var viewModel = GalleryViewModel()
    var indextpath:Int = .indexpathNumber
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getImage()
        viewModel.getVideo()
        registercollectionView()
        collectionView.delegate = self
        collectionView.dataSource = self
        startActiveIndicator()
        updateViewAndIndicator()

    }
    func custominit(intex:Int) {
        self.indextpath = intex
    }
    private func registercollectionView() {
        collectionView.register(UINib(nibName: String.CellIdentifire.SubGalleryCell, bundle: nil), forCellWithReuseIdentifier: String.CellIdentifire.SubGalleryCell)
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

}

extension SubGalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if indextpath == .indexpathNumber {
            return viewModel.subGalleryImageArray.count
            
        } else  {
            return viewModel.subGalleryVideoArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String.CellIdentifire.SubGalleryCell, for: indexPath) as? SubGalleryCollectionViewCell else { fatalError()}
        
        if indextpath == .indexpathNumber {
            let imageItem = viewModel.subGalleryImageArray[indexPath.row]
            cell.imageConfig(item: imageItem)

        }else {
            let item = viewModel.subGalleryVideoArray[indexPath.row]
             cell.config(item: item)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 230)
    }

    
}
