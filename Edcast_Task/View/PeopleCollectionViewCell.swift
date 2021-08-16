//
//  PeopleCollectionViewCell.swift
//  Edcast_Task
//
//  Created by Shreenivas on 16/08/21.
//

import UIKit

class PeopleCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = "peopleCollectionViewCell"
    
    @IBOutlet weak var peopleImage: UIImageView!
    @IBOutlet weak var peopleName: UILabel!
    
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
    
    var people: People? {
        didSet {
            peopleImage.layer.cornerRadius = 27
            
            
            if (people?.isSelected ?? false) {
                peopleImage.layer.borderColor = UIColor.green.cgColor
                peopleImage.layer.borderWidth = 1
            }else{
                peopleImage.layer.borderWidth = 0
            }
            peopleName.text = people?.personName ?? ""
            peopleImage.image = UIImage(named: people?.personProfileImg ?? "")
        }
    }
}
