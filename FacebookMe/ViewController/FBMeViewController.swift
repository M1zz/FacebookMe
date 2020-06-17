//
//  ViewController.swift
//  FacebookMe
//
//  Created by 이현호 on 2020/06/09.
//  Copyright © 2020 tempYsoup. All rights reserved.
//

import UIKit

class FBMeViewController: FBMeBaseViewController {
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "FaceBook"
        navigationController?.navigationBar.barTintColor = .gray
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
}

extension FBMeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      return " "
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if indexPath.row == 0 {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: nil)
            cell.textLabel?.text = "이현호"
            cell.imageView?.image = UIImage(named: "bayMax")
            cell.detailTextLabel?.text = "IOS 개발자"
        } else if indexPath.row == 1{
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: nil)
            cell.textLabel?.text = "이현호2"
            cell.imageView?.image = UIImage(named: "bayMax")
            cell.detailTextLabel?.text = "IOS 개발자"
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
