//
//  GridTableViewCell.swift
//  Edcast_Task
//
//  Created by Shreenivas on 16/08/21.
//

import UIKit

class GridTableViewCell: UITableViewCell {

    static let reuseIdentifier = "gridTableViewCell"
    
    static let minimumLineSpacing: CGFloat = 10
    static let minimumInteritemSpacing: CGFloat = 10
    static let numberOfItemPerLine: Int = 2
    static let topBottomLeftRightInset: CGFloat = 10
    static let itemHeight: CGFloat = 63
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let nib = UINib.init(nibName: "GridItemCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: GridItemCollectionViewCell.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var dashBoardSectonItem: DashBoardSectonItem? {
        didSet {
            titleLabel.text = dashBoardSectonItem?.sectionTile ?? ""
            collectionView.reloadData()
        }
    }
    
    
}

//MARK:- UICollectionViewDataSource
extension GridTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridItemCollectionViewCell.reuseIdentifier, for: indexPath) as! GridItemCollectionViewCell
        if let gridItemObj = dashBoardSectonItem?.sectionItems[indexPath.row] as? GridItem {
            cell.gridItem = gridItemObj
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dashBoardSectonItem?.sectionItems.count ?? 0
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension GridTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionWidth = collectionView.frame.width
        
        let numberOfItemsInRow = CGFloat(GridTableViewCell.numberOfItemPerLine)
        
        let cellWidth = (((collectionWidth - ((numberOfItemsInRow - 1) * GridTableViewCell.minimumInteritemSpacing) - (numberOfItemsInRow * GridTableViewCell.topBottomLeftRightInset))) / numberOfItemsInRow)
        
        return CGSize(width: cellWidth, height: GridTableViewCell.itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return GridTableViewCell.minimumLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return GridTableViewCell.minimumInteritemSpacing
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = GridTableViewCell.topBottomLeftRightInset
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
}

