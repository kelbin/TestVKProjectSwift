//
//  ViewController.swift
//  TestProjectVKSwift
//
//  Created by Максим Савченко on 22.07.2018.
//  Copyright © 2018 Максим Савченко. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://oauth.vk.com/authorize?client_id=6638593&display=page&redirect_uri=https://oauth.vk.com/blank.html&scope=friends&response_type=token&v=5.52")
        let urlRequest = URLRequest(url: url!)
        
        webView.delegate = self
        webView.loadRequest(urlRequest)
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let result = request.url?.absoluteString.replacingOccurrences(of: "#", with: "?")
        let resURL = URL(string: result!)
        guard let url = resURL else { return false }
        
        if url.absoluteString.contains("access_token") {
            UserDefaults.standard.set(resURL?.queryParameters?["access_token"], forKey: "token")
            requestsResult(token: resURL?.queryParameters?["access_token"])
            return false
        } else {
            return true
        }
    }

    private func requestsResult(token: String?) {
        Requests.idRequest(token: token, { [weak self] (id, success) in
            if success {
                Requests.friendsRequest(id: id, token: token, count:
                    10, { [weak self] (friends, success) in
                        if success {
                            UserDefaults.standard.set(id, forKey: "id")
                            self?.performSegue(withIdentifier: "toFriends", sender: friends)
                        } else
                        {
                            Connectivity.checkError(viewCon: self!)
                        }
                })
            } else {
                Connectivity.checkError(viewCon: self!)
            }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFriends"
        {
            let navbar = segue.destination as! UINavigationController
            let destinationCon = navbar.viewControllers.first as! FriendsTableViewController
            destinationCon.friendsArray = sender as? [FriendsItems]
        }
    }
    
}

