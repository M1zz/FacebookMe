//
//  FMMeBaseCell.swift
//  FacebookMe
//
//  Created by 이현호 on 2020/06/20.
//  Copyright © 2020 tempYsoup. All rights reserved.
//

import UIKit

class FBMeImageTitleCell: UITableViewCell {
    static let identifier = "FBMeImageTitleCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
}
