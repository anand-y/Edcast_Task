//
//  DashboardVM.swift
//  Edcast_Task
//
//  Created by Shreenivas on 15/08/21.
//

import Foundation
import UIKit

class DashboardVM {
    
    let dashboardOptionArr: [DashboardOption] = [
                                DashboardOption(id: 1, name: "Overview", isSelected: true),
                                DashboardOption(id: 2, name: "Learning Plan", isSelected: false),
                                DashboardOption(id: 3, name: "Assignment", isSelected: false),
                                DashboardOption(id: 4, name: "Learning Path", isSelected: false)
                            ]

    let dashboardDatasourceArr: [DashBoardSectonItem] = [
                                    DashBoardSectonItem(sectionEnum: .people, sectionTile: "", sectionItems: peopleArr),
                                    DashBoardSectonItem(sectionEnum: .grid, sectionTile: "Summary Of Abhishek Team", sectionItems: gridItemArr),
                                    DashBoardSectonItem(sectionEnum: .list, sectionTile: "Top Learning Goal", sectionItems: learningListArr),
                                    DashBoardSectonItem(sectionEnum: .list, sectionTile: "Top Skill (Assesment)", sectionItems: skillsArr)
                                ]
    
    func dashboardOption(at index: Int) -> DashboardOption? {
        return dashboardOptionArr[index]
    }
    
    func dashBoardSectonItem(at index: Int) -> DashBoardSectonItem? {
        return dashboardDatasourceArr[index]
    }
    
    func calculateNumberOfGridRows(for index:Int) -> Int {
        
        let dashBoardSectonItem = dashboardDatasourceArr[index]
        let itemCount = dashBoardSectonItem.sectionItems.count
        
        return (itemCount / GridTableViewCell.numberOfItemPerLine) + (itemCount % GridTableViewCell.numberOfItemPerLine)
    }
    
    func calculateGridHeight(at index: Int, numberOfRows: Int) -> CGFloat {
        
        let dashBoardSectonItem = dashboardDatasourceArr[index]
        let itemCount = dashBoardSectonItem.sectionItems.count
        if itemCount > 0 {
            
            let topBottomInsetSpace = GridTableViewCell.topBottomLeftRightInset * 2
            let totalInterItemSpacing = ((numberOfRows - 1) * Int(GridTableViewCell.minimumLineSpacing))
            let allItemHeight = (GridTableViewCell.itemHeight * CGFloat(numberOfRows))
            let height = CGFloat(topBottomInsetSpace + CGFloat(totalInterItemSpacing) + allItemHeight + 31)
            
            return height
        }
        return 0.0
    }
    
    func calculateListSectionHeight(at index: Int) -> CGFloat {
        let dashBoardSectonItem = dashboardDatasourceArr[index]
        let itemCount = dashBoardSectonItem.sectionItems.count
        if itemCount > 0 {
            let cellHeight = 28
            let containerConstraintSpacing = 54
            let height = CGFloat(cellHeight * itemCount) + CGFloat(containerConstraintSpacing)
            return height
        }
        return 0.0
    }
}
