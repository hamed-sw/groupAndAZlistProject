//
//  GalleryTableViewCell.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 26.11.2021.
//

import UIKit

class GalleryTableViewCell: UITableViewCell {

    @IBOutlet weak var galleryLabel: UILabel!
    @IBOutlet weak var galleryImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
