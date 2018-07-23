//
//  Requests.swift
//  TestProjectVKSwift
//
//  Created by Максим Савченко on 22.07.2018.
//  Copyright © 2018 Максим Савченко. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import Alamofire

final class Requests {
    
    private init() {}
    
    public static func friendsRequest(id: Int?, token: String?, count: Int?, _ success: @escaping (_ friends: [FriendsItems]?, _ success: Bool) -> Void)  {
        
        let params: Parameters = [
            "user_id": id ?? 0,
            "order": "name",
            "count": count ?? 5000,
            "fields": "photo_50,photo_100",
            "name_case": "ins",
            "v": 5.80,
            "access_token": token ?? ""
        ]
        
        print(params)
        
        Alamofire.request("https://api.vk.com/method/friends.get", method: .post, parameters: params, encoding: URLEncoding.default ).validate(statusCode: 1 ..< 300).responseObject { (response: DataResponse<Friends>) in
            print("Request: \(String(describing: response.request))")
            print("Response: \(String(describing: response.response))")
            print("Error: \(String(describing: response.error))")
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
            }
            
            switch response.result {
            case .success:
                guard let friends = response.result.value else { return }
                print(friends.items)
                success(friends.items, true)
            case .failure(let error):
                success(nil, false)
                print("Error", error.localizedDescription)
            }
        }
    }
    
    public static func idRequest(token: String?, _ success: @escaping (_ id: Int?, _ success: Bool ) -> Void)  {
        
        let params: Parameters = [
            "name_case": "Nom",
            "v": 5.80,
            "access_token": token ?? ""
        ]
        
        print(params)
        
        Alamofire.request("https://api.vk.com/method/users.get", method: .post, parameters: params, encoding: URLEncoding.default ).validate(statusCode: 1 ..< 300).responseObject { (response: DataResponse<UserId>) in
            print("Request: \(String(describing: response.request))")
            print("Response: \(String(describing: response.response))")
            print("Error: \(String(describing: response.error))")
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                
                print("Data: \(utf8Text)")
            }
            
            switch response.result {
            case .success:
                guard let userId = response.result.value else { return }
                success(userId.array?[0].id, true)
            case .failure(let error):
                success(nil, false)
                print("Error", error.localizedDescription)
            }
        }
    }
    
   /*static public func convertToDictionary(text: String) -> [[String: String]]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [[String: String]]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }*/

    
}

//TODO: Скелет Колбеков
/*class RequestsCallBack: Requests {
    
    public func authorizeCallBack(token: String?, viewCon: UIViewController, count: Int) {
        idRequest(token: token, { [weak viewCon] (id, success) in
            if success {
                self.friendsRequest(id: id, token: token, count:
                    10, { [weak viewCon] (friends, success) in
                        if success {
                            UserDefaults.standard.set(id, forKey: "id")
                            viewCon?.performSegue(withIdentifier: "toFriends", sender: friends)
                        } else
                        {
                            Alerts.ErorMessage(title: "Ошибка", message: "Ошибка временная", viewController: viewCon!)
                        }
                })
            } else {
                Alerts.ErorMessage(title: "Ошибка", message: "Ошибка временная", viewController: viewCon!)
            }
        })
    }
    
    public func friendsRequestCallBack() 
    
}*/

final class Connectivity {
    class func checkError(viewCon: UIViewController) {
        if NetworkReachabilityManager()!.isReachable == false {
            Alerts.ErorMessage(title: "Ошибка", message: "Нету соединения с интернетом", viewController: viewCon)
        } else {
            Alerts.ErorMessage(title: "Ошибка", message: "Временная ошибка", viewController: viewCon)
        }
    }
}
