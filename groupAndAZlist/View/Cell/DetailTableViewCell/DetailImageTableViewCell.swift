//
//  DetailImageTableViewCell.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 29.11.2021.
//

import UIKit

class DetailImageTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    var nasaImages = [String]()
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        pageController.hidesForSinglePage = true

        collectionViewRegister()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func collectionViewRegister() {
        collectionView.register(UINib(nibName: String.CellIdentifire.detailCollectionCell, bundle: nil), forCellWithReuseIdentifier: String.CellIdentifire.detailCollectionCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageController.numberOfPages = nasaImages.count
        pageController.isHidden = !(nasaImages.count > 1)
        return nasaImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String.CellIdentifire.detailCollectionCell, for: indexPath) as? DetailCollectionViewCell else { fatalError()}
        let images = nasaImages[indexPath.row]
        cell.config(item: images)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageController.currentPage = indexPath.row
    }
    
}

  
    
    

