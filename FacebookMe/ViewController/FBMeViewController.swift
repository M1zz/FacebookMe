//
//  ViewController.swift
//  FacebookMe
//
//  Created by 이현호 on 2020/06/09.
//  Copyright © 2020 tempYsoup. All rights reserved.
//

import UIKit

class FBMeViewController: FBMeBaseViewController {
    static let identifier = "FBMeBaseCell"
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "FaceBook"
        navigationController?.navigationBar.barTintColor = UIColor(hex: 0x4267B2)
        configureTableView()
    }
    
    private func configureTableView() {
        // add view
        view.addSubview(tableView)
        // set delegate
        tableView.delegate = self
        tableView.dataSource = self
        // get rowHeight
        // register cell
        // set constrains
        tableView.pin(to: view)
    }
    
    private func rows(at section: Int) -> Int {
        let count:[Int] = [1,7,0,1,3,1]
        return count[section]
    }
    
    private func getHeaderTitle(at section: Int) -> String{
        let header = [" ", " ", " ", "FAVORITE", " ", " "]
        
        return header[section]
    }
    
    private func tableViewTextDataSource(at indexPath: IndexPath) -> String {
        let title = ["Friends", "Events", "Groups", "CMU", "Town Hall", "Instant Games", "See More..."]
        return title[indexPath.row]
    }
    
    private func tableViewImageDataSource(at indexPath: IndexPath) -> String {
        let image = ["fb_friends", "fb_events", "fb_groups", "fb_education", "fb_town_hall", "fb_games", "fb_placeholder"]
        
        return image[indexPath.row]
    }
    
    private func tableViewSettingDataSource(at indexPath: IndexPath) -> String {
        let title = ["Settings", "Privacy Shortcuts", "Help and Support"]
        return title[indexPath.row]
    }
    
    private func tableViewSettingImageDataSource(at indexPath: IndexPath) -> String {
        let image = ["fb_settings", "fb_privacy_shortcuts", "fb_help_and_support"]
        
        return image[indexPath.row]
    }
}

extension FBMeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows(at: section)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      return getHeaderTitle(at: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        switch indexPath.section {
        case 0:
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: nil)
            cell.textLabel?.text = "이현호"
            cell.imageView?.image = UIImage(named: "bayMax")
            cell.detailTextLabel?.text = "IOS 개발자"
        case 1:
            cell = UITableViewCell.init(style: .default, reuseIdentifier: nil)
            let titleName = tableViewTextDataSource(at: indexPath)
            let imageName = tableViewImageDataSource(at: indexPath)
            cell.textLabel?.text = titleName
            cell.imageView?.image = UIImage(named: imageName)
        case 3:
            cell = UITableViewCell.init(style: .default, reuseIdentifier: nil)
            let titleName = "Add Favorites..."
            let imageName = "fb_placeholder"
            cell.textLabel?.text = titleName
            cell.imageView?.image = UIImage(named: imageName)
        case 4:
            cell = UITableViewCell.init(style: .default, reuseIdentifier: nil)
            let titleName = tableViewSettingDataSource(at: indexPath)
            let imageName = tableViewSettingImageDataSource(at: indexPath)
            cell.textLabel?.text = titleName
            cell.imageView?.image = UIImage(named: imageName)
        case 5:
            cell = UITableViewCell.init(style: .default, reuseIdentifier: nil)
            let titleName = "Log Out"
            cell.textLabel?.text = titleName
            cell.textLabel?.textColor = .red
            cell.textLabel?.textAlignment = .center
        default:
            print("error")
        }

        return cell
    }
}

extension FBMeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.accessoryType = .disclosureIndicator
    }

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension UIColor {
    convenience init(r: Int, g: Int, b: Int, a: CGFloat) {
      self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: a)
    }
    
    convenience init(hex: Int) {
      self.init(r: (hex & 0xff0000) >> 16, g: (hex & 0xff00) >> 8, b: (hex & 0xff), a: 1)
    }
}
