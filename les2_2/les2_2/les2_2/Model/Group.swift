//
//  Group.swift
//  les2_2
//
//  Created by Роман Чикишев on 13.01.2022.
//

import UIKit
import RealmSwift

struct Group: Decodable {
    let response: ResponseGroups
}

struct ResponseGroups: Decodable {
    let count: Int
    let items: [Groups]
}

class Groups: Object, Decodable {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var photo50 = ""
    @objc dynamic var isMember = 0
    

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo50 = "photo_50"
        case isMember = "is_member"
    }
    override class func primaryKey() -> String? {
        return "id"
    }
}
