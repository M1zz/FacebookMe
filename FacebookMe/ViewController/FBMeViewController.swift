//
//  ViewController.swift
//  FacebookMe
//
//  Created by 이현호 on 2020/06/09.
//  Copyright © 2020 tempYsoup. All rights reserved.
//

import UIKit

class FBMeViewController: FBMeBaseViewController {
    typealias RowModel = [String: String]

    private var tableView = UITableView(frame: .zero, style: .grouped)
    private var user = UserProfile(name: "Leeo", avatarName: "bayMax", education: "CNU")
    
    private var tableViewDataSource: [[String: Any]] {
        get {
            return TableKeys.fetchData(withUser: user)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "FaceBook"
        navigationController?.navigationBar.barTintColor = Specs.color.facebook
        configureTableView()
    }
    
    
    private func configureTableView() {
        // add view
        view.addSubview(tableView)
        // set delegate
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FBMeImageTitleCell.self, forCellReuseIdentifier: FBMeImageTitleCell.identifier)
        tableView.pin(to: view)
    }
    
    
    // 섹션을 입력 -> data의 한 섹션의 데이터 반환
    private func rows(at section: Int) -> [Any] {
        return tableViewDataSource[section][TableKeys.Rows] as! [Any]
    }
    
    
    // IndexPath 입력 -> 섹션의 row 데이터 반환
    private func rowModel(at indexPath: IndexPath) -> RowModel {
        return rows(at: indexPath.section)[indexPath.row] as! RowModel
    }
    
    
    private func title(at section: Int) -> String? {
        return tableViewDataSource[section][TableKeys.Section] as? String
    }
}

extension FBMeViewController: UITableViewDataSource {
    // Number of Section == Data Source's length
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewDataSource.count
    }
    
    
    // Each Section has different rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows(at: section).count
    }
    
    
    // Get Title of Section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return title(at: section)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let modelForRow = rowModel(at: indexPath)
        var cell = UITableViewCell()
        
        guard let title = modelForRow[TableKeys.Title] else {
            return cell
        }
        
        // profile needs subTitle
        if title == user.name {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: nil)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: FBMeImageTitleCell.identifier, for: indexPath)
        }
        
        // set title
        cell.textLabel?.text = title
        if title == user.name {
            cell.detailTextLabel?.text = modelForRow[TableKeys.SubTitle]
        }
        
        // set image
        if let imageName = modelForRow[TableKeys.ImageName] {
            cell.imageView?.image = UIImage(named: imageName)
        } else {
            cell.imageView?.image = UIImage(named: Specs.imageName.placeholder)
        }
        
        return cell
    }
}

extension FBMeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let modelForRow = rowModel(at: indexPath)
        
        guard let title = modelForRow[TableKeys.Title] else {
            return
        }
        
        // set blue color to moremenu
        if title == TableKeys.seeMore || title == TableKeys.addFavorites {
            cell.textLabel?.textColor = Specs.color.facebook
            cell.accessoryType = .none
        } else if title == TableKeys.logout { // set logout
            cell.textLabel?.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
            cell.textLabel?.textColor = Specs.color.red
            cell.textLabel?.textAlignment = .center
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .disclosureIndicator
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let modelForRow = rowModel(at: indexPath)
        
        guard let title = modelForRow[TableKeys.Title] else {
            return 0.0
        }
        
        if title == user.name {
            return 64.0
        } else {
            return 44.0
        }
    }
    
}
