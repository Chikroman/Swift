//
//  Adapter.swift
//  homeWork_1
//
//  Created by Роман Чикишев on 10.06.2022.
//  Copyright © 2022 Марат Нургалиев. All rights reserved.
//

import UIKit
import RealmSwift


struct VkFriendAdapter {
    
    let uid = 0
    let online = 0
    let user_id = 0
    let nickname = ""
    let last_name = ""
    let first_name = ""
    let full_name = ""
    let photo = ""
}
//не уверен что правильно
class VkFriendAdapter {
    let VkFriendAdapter = VkFriendAdapter()
    
    func getFriends(delegate: VkApiFriendsDelegate, then completion: @escaping) -> Void {
        let method = "friends.get"
        let fullRow = "\(GlobalConstants.vkApi)\(method)"
        let params: Parameters = [
            "access_token": Session.instance.token,
            "fields": "id,nickname,photo_100,status",
            "v": "3.0",
            ]
        
        Alamofire.request(fullRow, method: .get, parameters: params)
            .responseJSON(queue: DispatchQueue.global(qos: .userInteractive)) { response in
                let friends = VkResponseParser.instance
                completion (.parseFriends(result: response.result))

                }
                
                
        }
    }
}
