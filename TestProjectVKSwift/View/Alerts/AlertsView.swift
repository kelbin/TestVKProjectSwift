//
//  AlertsView.swift
//  TestProjectVKSwift
//
//  Created by Максим Савченко on 22.07.2018.
//  Copyright © 2018 Максим Савченко. All rights reserved.
//

import Foundation
import UIKit

final class Alerts {
    
    private init() {}
    
    public static func ErorMessage(title: String, message: String, viewController: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Продолжить", style: UIAlertActionStyle.default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
}
