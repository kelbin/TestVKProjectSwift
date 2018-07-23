//
//  UserID.swift
//  TestProjectVKSwift
//
//  Created by Максим Савченко on 22.07.2018.
//  Copyright © 2018 Максим Савченко. All rights reserved.
//

import Foundation
import ObjectMapper

class UserId: Mappable {
    var array: [UserDataArray]?
    
    
    required convenience init?(map: Map)
    {
        self.init()
    }
    
    func mapping(map: Map)
    {
        array <- map["response"]
    }
    
}

class UserDataArray: Mappable {
    var id: Int?
    
    required convenience init?(map: Map)
    {
        self.init()
    }
    
    func mapping(map: Map)
    {
        id <- map["id"]
    }
    
}
