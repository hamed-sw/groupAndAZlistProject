//
//  NasaCollectionViewCell.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 26.11.2021.
//

import UIKit

class NasaCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView! 
    
    func join(_ item: NasaItem) {
        
        layer.cornerRadius = 10
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.text = item.title
       // if item != nil {
            iconImage.image = UIImage(named: item.image)
        //}
        
        
        
    }
}
