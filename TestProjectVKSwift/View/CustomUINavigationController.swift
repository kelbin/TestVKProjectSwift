//
//  CustomUINavigationController.swift
//  TestProjectVKSwift
//
//  Created by Максим Савченко on 22.07.2018.
//  Copyright © 2018 Максим Савченко. All rights reserved.
//

import UIKit

class CustomUINavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.navigationBar.tintColor = UIColor.white
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        self.navigationBar.titleTextAttributes = textAttributes
        self.navigationBar.barTintColor = UIColor.hexStr("#3774b8")
    }

}
