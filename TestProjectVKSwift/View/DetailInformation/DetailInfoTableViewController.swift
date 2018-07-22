//
//  DetailInfoTableViewController.swift
//  TestProjectVKSwift
//
//  Created by Максим Савченко on 22.07.2018.
//  Copyright © 2018 Максим Савченко. All rights reserved.
//

import UIKit

class DetailInfoTableViewController: UITableViewController {
    
    public var detailInformation: FriendsItems?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "\(detailInformation?.firstName ?? "") \(detailInformation?.lastName ?? "")"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.tableFooterView = UIView()
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailInformationTableViewCell", for: indexPath) as? DetailInformationTableViewCell, let information = detailInformation else { fatalError("Message") }
            cell.configure(withModel: information)
            tableView.separatorStyle = .none
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ActionDetailInformationTableViewCell", for: indexPath) as? ActionDetailInformationTableViewCell else { fatalError("Message") }
            tableView.separatorStyle = .none
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionDetailInformationTableViewCell", for: indexPath) as? CollectionDetailInformationTableViewCell else { fatalError("Message") }
            tableView.separatorStyle = .singleLine
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
            tableView.separatorStyle = .none
            return cell

        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 82
        case 1:
            return 61
        case 2:
            return 62
        default:
            return 60
        }
    }

}
