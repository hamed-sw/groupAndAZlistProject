//
//  SubGalleryCollectionViewCell.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 29.11.2021.
//

import UIKit

class SubGalleryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var theLabel: UILabel!
    @IBOutlet weak var theImage: UIImageView!
    var viewModel = GalleryViewModel()
    override func awakeFromNib() {
        super.awakeFromNib()
        theLabel.sizeToFit()
        // Initialization code
    }
    
    func config(item: VideoData) {
        theLabel.text = item.title
        viewModel.imageDownload(str: item.url!, cell: self)
    }
    
    func imageConfig(item: ImageData) {
        theLabel.text = item.title
        viewModel.imageDownload(str: item.url!, cell: self)
    }

}
