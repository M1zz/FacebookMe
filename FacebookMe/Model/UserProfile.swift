//
//  UserProfile.swift
//  FacebookMe
//
//  Created by 이현호 on 2020/06/20.
//  Copyright © 2020 tempYsoup. All rights reserved.
//

import UIKit

class UserProfile {
    var name: String
    var avatarName: String
    var education: String
    
    init(name: String, avatarName: String, education: String) {
        self.name = name
        self.avatarName = avatarName
        self.education = education
    }
}
