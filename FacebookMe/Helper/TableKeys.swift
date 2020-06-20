//
//  TableKeys.swift
//  FacebookMe
//
//  Created by 이현호 on 2020/06/20.
//  Copyright © 2020 tempYsoup. All rights reserved.
//

import Foundation

public struct TableKeys {
    // Set table keys
    static let Section = "section"
    static let Rows = "rows"
    static let ImageName = "imageName"
    static let Title = "title"
    static let SubTitle = "subTitle"
    static let seeMore = "See More..."
    static let addFavorites = "Add Favorites..."
    static let logout = "Log Out"
    
    static func fetchData(withUser user: UserProfile) -> [[String:Any]]{
        return [
            [
                TableKeys.Rows: [
                    [TableKeys.ImageName:user.avatarName,
                    TableKeys.Title:user.name,
                    TableKeys.SubTitle:"IOS 개발자 입니다."]
                ]
            ], // section 0
            [
                TableKeys.Rows: [
                    [TableKeys.ImageName: Specs.imageName.friends, TableKeys.Title: "Friends"],
                    [TableKeys.ImageName: Specs.imageName.events, TableKeys.Title: "Events"],
                    [TableKeys.ImageName: Specs.imageName.groups, TableKeys.Title: "Groups"],
                    [TableKeys.ImageName: Specs.imageName.education, TableKeys.Title: user.education],
                    [TableKeys.ImageName: Specs.imageName.townHall, TableKeys.Title: "Town Hall"],
                    [TableKeys.ImageName: Specs.imageName.instantGames, TableKeys.Title: "Instant Games"],
                    [TableKeys.Title: TableKeys.seeMore]
                ]
            ], // section 1
            [
                TableKeys.Section: "FAVORITES",
                TableKeys.Rows: [
                  [TableKeys.Title: "muck bang"],
                  [TableKeys.Title: "K-pop"],
                  [TableKeys.Title: TableKeys.addFavorites]
                ]
            ], // section 2
            [
                TableKeys.Rows: [
                  [TableKeys.ImageName: Specs.imageName.settings,
                   TableKeys.Title: "Settings"],
                  [TableKeys.ImageName: Specs.imageName.privacyShortcuts, TableKeys.Title: "Privacy Shortcuts"],
                  [TableKeys.ImageName: Specs.imageName.helpSupport,
                   TableKeys.Title: "Help and Support"]
                ]
            ], // section 3
            [
                TableKeys.Rows: [
                  [TableKeys.Title: TableKeys.logout]
                ]
            ] // section 4
        ]

    }
}
