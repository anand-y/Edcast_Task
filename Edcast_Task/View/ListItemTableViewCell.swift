//
//  ListItemTableViewCell.swift
//  Edcast_Task
//
//  Created by Shreenivas on 16/08/21.
//

import UIKit

class ListItemTableViewCell: UITableViewCell {

    static let reuseIdentifier = "listItemTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    var listItem: ListItem? {
        didSet {
            titleLabel.text = listItem?.itemName ?? ""
            countLabel.text = (listItem!.itemCount != 0) ? "\(listItem!.itemCount)" : ""
        }
    }
}
