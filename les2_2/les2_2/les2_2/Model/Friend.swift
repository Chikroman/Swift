//
//  Friend.swift
//  les2_2
//
//  Created by Роман Чикишев on 13.01.2022.
//
import UIKit
import RealmSwift

struct Friend: Decodable {
    let response: ResponseFriends
}

struct ResponseFriends: Decodable {
    let count: Int
    let items: [Friends]
}

class Friends: Object, Decodable {
    @objc dynamic var id = 0
    @objc dynamic var firstName = ""
    @objc dynamic var lastName = ""
    @objc dynamic var photo50 = ""

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo50 = "photo_50"
    }
    override class func primaryKey() -> String? {
        return "id"
    }
}
