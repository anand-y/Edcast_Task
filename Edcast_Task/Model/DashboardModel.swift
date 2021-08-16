//
//  DashboardModel.swift
//  Edcast_Task
//
//  Created by Shreenivas on 15/08/21.
//

import Foundation

//MARK:- DashboardSectionEnum
enum DashboardSectionEnum {
    case people
    case grid
    case list
}

//MARK:- GenderEnum
enum GenderEnum {
    case male
    case female
}

//MARK:- DashboardOption
struct DashboardOption {
    let id: Int
    let name: String
    var isSelected: Bool
}

//MARK:- People
struct People {
    let personId: Int
    let personName: String
    let personProfileImg: String
    let gender: GenderEnum
    let isSelected: Bool
}

//MARK:- GridItem
struct GridItem {
    let completedCount: String
    let gridDescription: String
}

//MARK:- ListItem
struct ListItem {
    let itemName: String
    let itemCount: Int
}

//MARK:- DashBoardSectonItem
struct DashBoardSectonItem {
    let sectionEnum: DashboardSectionEnum
    let sectionTile: String
    let sectionItems: [Any]
}

//MARK:- Data
let peopleArr = [
                    People(personId: 1, personName: "Ashutosh Upadhayay", personProfileImg: "userMale", gender: .male, isSelected: true),
                    People(personId: 2, personName: "Semina Croft", personProfileImg: "userFemale", gender: .female, isSelected: false),
                    People(personId: 3, personName: "Daichi Lee", personProfileImg: "userMale", gender: .male, isSelected: false),
                    People(personId: 4, personName: "Monika Kent", personProfileImg: "userFemale", gender: .female, isSelected: false),
                    People(personId: 5, personName: "Sam Nason", personProfileImg: "userMale", gender: .male, isSelected: false)
                ]

let gridItemArr = [
                        GridItem(completedCount: "44", gridDescription: "Overall Activity"),
                        GridItem(completedCount: "25", gridDescription: "Overall Activity"),
                        GridItem(completedCount: "5", gridDescription: "Overall Activity"),
                        GridItem(completedCount: "1200", gridDescription: "Overall Activity"),
                        GridItem(completedCount: "86h 26m", gridDescription: "Overall Activity"),
                        GridItem(completedCount: "19", gridDescription: "Overall Activity"),
                        GridItem(completedCount: "22", gridDescription: "Overall Activity"),
                        GridItem(completedCount: "3", gridDescription: "Overall Activity")
                    ]

let learningListArr = [
                        ListItem(itemName: "Leadership", itemCount: 2),
                        ListItem(itemName: "Product Management", itemCount: 1),
                        ListItem(itemName: "Statistics", itemCount: 3),
                        ListItem(itemName: "Mobile Learning", itemCount: 1)
                    ]

let skillsArr = [
                    ListItem(itemName: "Leadership", itemCount: 1),
                    ListItem(itemName: "Product Management", itemCount: 1),
                    ListItem(itemName: "Statistics", itemCount: 1),
                    ListItem(itemName: "Mobile Learning", itemCount: 1)
                ]
                            
