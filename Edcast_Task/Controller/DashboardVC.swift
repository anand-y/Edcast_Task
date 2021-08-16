//
//  DashboardVC.swift
//  Edcast_Task
//
//  Created by Shreenivas on 15/08/21.
//

import UIKit

class DashboardVC: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var collectionViewLayout: UICollectionViewFlowLayout! {
        didSet {
            collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    var vm = DashboardVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        collectionView.dataSource = self
        collectionView.delegate = self
        let nib = UINib.init(nibName: "OptionCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: OptionCollectionViewCell.reuseIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let tableCellNib = UINib.init(nibName: "PeopleSectionCell", bundle: nil)
        tableView.register(tableCellNib, forCellReuseIdentifier: PeopleSectionCell.reuseIdentifier)
        tableView.tableFooterView = UIView()
        
        let gridCellNib = UINib.init(nibName: "GridTableViewCell", bundle: nil)
        tableView.register(gridCellNib, forCellReuseIdentifier: GridTableViewCell.reuseIdentifier)
        
        let listCellNib = UINib.init(nibName: "ListSectionTableViewCell", bundle: nil)
        tableView.register(listCellNib, forCellReuseIdentifier: ListSectionTableViewCell.reuseIdentifier)
        
        tableView.tableFooterView = UIView()
    }

}

//MARK:- UICollectionViewDataSource
extension DashboardVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.dashboardOptionArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OptionCollectionViewCell.reuseIdentifier, for: indexPath) as! OptionCollectionViewCell
        cell.dashOption = vm.dashboardOption(at: indexPath.row)
        return cell
    }
}

//MARK:- UICollectionViewDelegate
extension DashboardVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Setup for select action
    }
}

//MARK:- UITableViewDataSource
extension DashboardVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.dashboardDatasourceArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dashBoardSectonItem = vm.dashBoardSectonItem(at: indexPath.row)
        if dashBoardSectonItem?.sectionEnum == .people {
            let cell = tableView.dequeueReusableCell(withIdentifier: PeopleSectionCell.reuseIdentifier, for: indexPath) as! PeopleSectionCell
            cell.dashBoardSectonItem = dashBoardSectonItem
            return cell
        }
        if dashBoardSectonItem?.sectionEnum == .grid {
            let gridCell = tableView.dequeueReusableCell(withIdentifier: GridTableViewCell.reuseIdentifier, for: indexPath) as! GridTableViewCell
            gridCell.dashBoardSectonItem = dashBoardSectonItem
            return gridCell
        }
        if dashBoardSectonItem?.sectionEnum == .list {
            let listCell = tableView.dequeueReusableCell(withIdentifier: ListSectionTableViewCell.reuseIdentifier, for: indexPath) as! ListSectionTableViewCell
            listCell.dashBoardSectonItem = dashBoardSectonItem
            return listCell
        }
        return UITableViewCell()
    }
}
//MARK:- UITableViewDelegate
extension DashboardVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let dashBoardSectonItem = vm.dashBoardSectonItem(at: indexPath.row)
        if dashBoardSectonItem?.sectionEnum == .people {
            return 135
        }
        if dashBoardSectonItem?.sectionEnum == .grid {
            let numberOfRows = vm.calculateNumberOfGridRows(for: indexPath.row)
            let height = vm.calculateGridHeight(at: indexPath.row, numberOfRows: numberOfRows)
            return height
        }
        if dashBoardSectonItem?.sectionEnum == .list {
            let height = vm.calculateListSectionHeight(at: indexPath.row)
            return height
        }
        return 0
    }
}
