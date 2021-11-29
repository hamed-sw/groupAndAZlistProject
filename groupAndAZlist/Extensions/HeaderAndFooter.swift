//
//  HeaderAndFooter.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 29.11.2021.
//

import UIKit

class HeaderTabelView: UITableViewHeaderFooterView {
    
    let image: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let button: UIButton = {
       let button = UIButton()
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(red: 238/255, green: 236/255, blue: 201/255, alpha: 1)
        contentView.addSubview(image)
        contentView.addSubview(label)
        contentView.addSubview(button)
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if UIDevice.current.userInterfaceIdiom == .phone {
            image.frame = CGRect(x: 5, y: 5, width: 25, height: 25)
            label.frame = CGRect(x: 35, y: 5, width: 200, height: 25)
            label.font = .systemFont(ofSize: 20)
            button.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: 40)
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            image.frame = CGRect(x: 5, y: 5, width: 20, height: 20)
            label.frame = CGRect(x: 30, y: 5, width: 200, height: 20)
            label.font = .systemFont(ofSize: 18)
            button.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: 40)
            
        }
    }
    
    func config(text:String, theImage: UIImage) {
        label.text = text
        image.image = theImage
    }
}
