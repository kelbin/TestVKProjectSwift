//
//  Singleton.swift
//  TestProjectVKSwift
//
//  Created by Максим Савченко on 22.07.2018.
//  Copyright © 2018 Максим Савченко. All rights reserved.
//

import Foundation

final class Singleton {
    
    static let shared = Singleton()
    public var count = 10
    
    private init() {}
    
}
