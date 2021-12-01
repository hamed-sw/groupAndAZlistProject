//
//  SubGalleryViewController.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 29.11.2021.
//

import UIKit

class SubGalleryViewController: UIViewController {

    @IBOutlet weak var mianImage: UIImageView!
    @IBOutlet weak var activeIndicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    lazy var viewModel = GalleryViewModel()
    var indextpath:Int = .indexpathNumber
    var image: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mianImage.image = image
        viewModel.getImage()
        viewModel.getVideo()
        registercollectionView()
        collectionView.delegate = self
        collectionView.dataSource = self
        startActiveIndicator()
        updateViewAndIndicator()
        navigationBarHide()

    }
    func navigationBarHide() {
        if UIDevice.current.userInterfaceIdiom == .phone {
            navigationController?.setNavigationBarHidden(false, animated: false)
        } else {
            navigationController?.setNavigationBarHidden(true, animated: true)
        }
    }
    func custominit(intex:Int ) {
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

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let detail = storyboard?.instantiateViewController(withIdentifier: String.StoryBoardIdentity.detailVC) as? DetailViewController else { fatalError()}
        if indextpath == .indexpathNumber {
            guard let id = viewModel.subGalleryImageArray[indexPath.row].id else {return}
            detail.custoninit(id: id)
        }else {
            guard let id = viewModel.subGalleryVideoArray[indexPath.row].id else { return}
            detail.custoninit(id: id)
        }
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            navigationController?.pushViewController(detail, animated: true)
        } else {
            splitViewController?.showDetailViewController(detail, sender: nil)
        }
    }
}
