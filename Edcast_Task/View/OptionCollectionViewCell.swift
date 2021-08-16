//
//  OptionCollectionViewCell.swift
//  Edcast_Task
//
//  Created by Shreenivas on 15/08/21.
//

import UIKit

class OptionCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = "optionCollectionViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var parentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.translatesAutoresizingMaskIntoConstraints = false
             
         NSLayoutConstraint.activate([
             contentView.leftAnchor.constraint(equalTo: leftAnchor),
             contentView.rightAnchor.constraint(equalTo: rightAnchor),
             contentView.topAnchor.constraint(equalTo: topAnchor),
             contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    var dashOption: DashboardOption? {
        didSet {
            parentView.layer.cornerRadius = 18
            parentView.layer.borderWidth = 0.5
            
            if (dashOption?.isSelected ?? false) {
                parentView.backgroundColor = .systemGreen
                parentView.layer.borderColor = UIColor.systemGreen.cgColor
                titleLabel.textColor = .white
            }else{
                parentView.backgroundColor = .white
                parentView.layer.borderColor = UIColor.lightGray.cgColor
                titleLabel.textColor = .darkText
            }
            titleLabel.text = dashOption?.name ?? ""
        }
    }
}
