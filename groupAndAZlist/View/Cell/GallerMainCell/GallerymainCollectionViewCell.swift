//
//  GallerymainCollectionViewCell.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 30.11.2021.
//

import UIKit

class GallerymainCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var gallerylabel: UILabel!
    @IBOutlet weak var galleryImage: UIImageView!
    var viewModel = GalleryViewModel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
//    func config(item: VideoData) {
//        gallerylabel.text = item.title
//        viewModel.imageDownload1(str: item.url!, cell: self)
//    }
//
//    func imageConfig(item: ImageData) {
//        gallerylabel.text = item.title
//        viewModel.imageDownload1(str: item.url!, cell: self)
//    }
    
    func configer(item: GalleryItem) {
        gallerylabel.text = item.title
        galleryImage.image = UIImage(named: item.image)
    }


}
