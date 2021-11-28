//
//  AZListTableViewCell.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 26.11.2021.
//

import UIKit

class AZListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var azImage: UIImageView!
    var viewModel = AZlistAndGroupViewModel()
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configar(data: DataModel) {
        nameLabel.text = data.mediaType
        titleLabel.text = data.title
        viewModel.imageDisplay(str: data.url, cell: self)
        
    }
    
}
