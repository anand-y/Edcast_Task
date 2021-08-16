//
//  ListSectionTableViewCell.swift
//  Edcast_Task
//
//  Created by Shreenivas on 16/08/21.
//

import UIKit

class ListSectionTableViewCell: UITableViewCell {

    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    static let reuseIdentifier = "listSectionTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    func setupUI() {
        parentView.layer.cornerRadius = 8
        parentView.layer.masksToBounds = false
        parentView.layer.shadowRadius = 2
        parentView.layer.shadowOpacity = 0.1
        parentView.layer.shadowColor = UIColor.black.cgColor
        parentView.layer.shadowOffset = CGSize(width: 1 , height: 3)
        
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.dataSource = self

        let listNib = UINib.init(nibName: "ListItemTableViewCell", bundle: nil)
        tableView.register(listNib, forCellReuseIdentifier: ListItemTableViewCell.reuseIdentifier)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var dashBoardSectonItem: DashBoardSectonItem? {
        didSet {
            titleLabel.text = dashBoardSectonItem?.sectionTile ?? ""
            tableView.reloadData()
        }
    }
}

//MARK:- UITableViewDataSource
extension ListSectionTableViewCell: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dashBoardSectonItem?.sectionItems.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let listCell = tableView.dequeueReusableCell(withIdentifier: ListItemTableViewCell.reuseIdentifier, for: indexPath) as! ListItemTableViewCell
        if let listItemObj = dashBoardSectonItem?.sectionItems[indexPath.row] as? ListItem {
            listCell.listItem = listItemObj
        }
        return listCell
    }
}

