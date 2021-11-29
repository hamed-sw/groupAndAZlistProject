//
//  GroupTableViewCell.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 26.11.2021.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var groupImage: UIImageView!
    var viewModel = AZlistAndGroupViewModel()
    override func awakeFromNib() {
        super.awakeFromNib()
        groupLabel.sizeToFit()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(data:DataModel){
        groupLabel.text = data.title
        viewModel.imageDisplayGroup(str: data.url, cell: self)
        
    }
    
}
