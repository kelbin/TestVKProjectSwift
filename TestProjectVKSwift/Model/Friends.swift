//
//  Login.swift
//  TestProjectVKSwift
//
//  Created by Максим Савченко on 22.07.2018.
//  Copyright © 2018 Максим Савченко. All rights reserved.
//

import Foundation
import ObjectMapper

class Friends: Mappable
{
    var items: [FriendsItems]?
    
    required convenience init?(map: Map)
    {
        self.init()
    }
    
    func mapping(map: Map)
    {
        items <- map["response.items"]
    }
    
}

class FriendsItems: Mappable
{
    
    var firstName: String?
    var lastName: String?
    var photoSmall: String?
    var photoBig: String?
    var onlineStr: String? {
        switch online {
        case 0:
            return "Не в сети"
        case 1:
            return "Онлайн"
        default:
            return "Не в сети"
        }
    }
    
    var online: Int?
    
    required convenience init?(map: Map)
    {
        self.init()
    }
    
    func mapping(map: Map)
    {
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        photoSmall <- map["photo_50"]
        photoBig <- map["photo_100"]
        online <- map["online"]
    }
    
}
