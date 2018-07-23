//
//  FriendsTableViewController.swift
//  TestProjectVKSwift
//
//  Created by Максим Савченко on 22.07.2018.
//  Copyright © 2018 Максим Савченко. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    public var friendsArray: [FriendsItems]?
    
    private var id: Int? {
        return UserDefaults.standard.integer(forKey: "id")
    }
    
    
    private var token: String? {
        return UserDefaults.standard.string(forKey: "token")
    }
    
    
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    lazy var pullToRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(FriendsTableViewController.actionForPullToRefresher),
                                 for: UIControlEvents.valueChanged)
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Друзья"
        
        self.tableView.addSubview(self.pullToRefreshControl)
        self.tableView.tableFooterView? = footerView
        self.tableView.tableFooterView?.isHidden = true
    }
    
    @objc private func actionForPullToRefresher() {
        pullToRefreshControl.beginRefreshing()
        Requests.friendsRequest(id: id, token: token, count: nil) { [weak self]  (friends, success) in
            if success == true {
                self?.friendsArray = friends
                self?.tableView.reloadData()
                self?.pullToRefreshControl.endRefreshing()
            } else {
                Connectivity.checkError(viewCon: self!)
                self?.pullToRefreshControl.endRefreshing()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsArray?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as? FriendsTableViewCell else { fatalError("Message") }
        cell.configure(withModel: (friendsArray?[indexPath.row])!)
        return cell
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
            activityIndicator.startAnimating()
            Singleton.shared.count += 10
            self.tableView.tableFooterView?.isHidden = false
            if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height)
            {
                loadMoreItems()
            }
        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: friendsArray?[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let destinationCon = segue.destination as! DetailInfoTableViewController
            destinationCon.detailInformation = sender as? FriendsItems
        }
    }
    
    private func loadMoreItems() {
        Requests.friendsRequest(id: id, token: token, count: Singleton.shared.count) { [weak self] (friends, success) in
            if success {
                self?.friendsArray = friends
                self?.tableView.reloadData()
                self?.activityIndicator.stopAnimating()
                self?.tableView.tableFooterView?.isHidden = true
            } else {
                Connectivity.checkError(viewCon: self!)
            }
        }
    }
}
