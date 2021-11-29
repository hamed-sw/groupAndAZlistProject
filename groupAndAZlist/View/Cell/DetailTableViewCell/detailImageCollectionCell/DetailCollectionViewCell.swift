//
//  DetailCollectionViewCell.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 29.11.2021.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var detailImage: UIImageView!
    var viewModel = DetailViewModel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(item: String) {
        viewModel.imageDetailDisplay(str: item, cell: self)
    }

}
