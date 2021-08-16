//
//  GridItemCollectionViewCell.swift
//  Edcast_Task
//
//  Created by Shreenivas on 16/08/21.
//

import UIKit

class GridItemCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = "gridItemCollectionViewCell"
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var gridDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        parentView.layer.cornerRadius = 8
        parentView.layer.borderWidth = 1
        parentView.layer.borderColor = UIColor.lightGray.cgColor
    }
    var gridItem: GridItem? {
        didSet {
            countLabel.text = gridItem?.completedCount ?? ""
            gridDescriptionLabel.text = gridItem?.gridDescription ?? ""
        }
    }
}
