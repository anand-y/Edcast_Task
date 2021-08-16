//
//  PeopleSectionCell.swift
//  Edcast_Task
//
//  Created by Shreenivas on 16/08/21.
//

import UIKit

class PeopleSectionCell: UITableViewCell {

    static let reuseIdentifier = "peopleSectionCell"
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewLayout: UICollectionViewFlowLayout! {
        didSet {
            collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let nib = UINib.init(nibName: "PeopleCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: PeopleCollectionViewCell.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var dashBoardSectonItem: DashBoardSectonItem? {
        didSet {
            collectionView.reloadData()
        }
    }
}

//MARK:- UICollectionViewDelegate
extension PeopleSectionCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Setup for select action
    }
}

//MARK:- UICollectionViewDataSource
extension PeopleSectionCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PeopleCollectionViewCell.reuseIdentifier, for: indexPath) as! PeopleCollectionViewCell
        if let peopleObj = dashBoardSectonItem?.sectionItems[indexPath.row] as? People {
            cell.people = peopleObj
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dashBoardSectonItem?.sectionItems.count ?? 0
    }
}
