//
//  DetailExplanationTableViewCell.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 29.11.2021.
//

import UIKit

class DetailExplanationTableViewCell: UITableViewCell {

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
