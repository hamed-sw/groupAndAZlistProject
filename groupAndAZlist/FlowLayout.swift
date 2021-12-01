//
//  File.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 01.12.2021.
//

import UIKit

class FlowLayout: UICollectionViewFlowLayout{
    
    fileprivate struct LayoutState {
        var size: CGSize
        var direction: UICollectionView.ScrollDirection
        func isEqual(_ otherState: LayoutState) -> Bool {
            return self.size.equalTo(otherState.size) && self.direction == otherState.direction
        }
    }
    
    fileprivate var state = LayoutState(size: CGSize.zero, direction: .horizontal)
    override open func prepare() {
        super.prepare()
        
        let currentState = LayoutState(size: self.collectionView!.bounds.size, direction: self.scrollDirection)
        
        if !self.state.isEqual(currentState) {
            self.setupCollectionView()
            self.updateLayout()
            self.state = currentState
        }
    }
    
    fileprivate func setupCollectionView() {
        guard let collectionView = self.collectionView else { return }
        if collectionView.decelerationRate != UIScrollView.DecelerationRate.fast {
            collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        }
    }
    fileprivate func updateLayout() {
        guard let collectionView = self.collectionView else { return }

        let collectionSize = collectionView.bounds.size

        let yInset = (collectionSize.height - self.itemSize.height) / 2
        let xInset = (collectionSize.width - self.itemSize.width) / 2
        self.sectionInset = UIEdgeInsets.init(top: yInset, left: xInset, bottom: yInset, right: xInset)
        self.minimumLineSpacing = 60


    }
    override open func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
