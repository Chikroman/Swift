//
//  Storage.swift
//  les2_2
//
//  Created by Роман Чикишев on 13.01.2022.
//

import UIKit

class Storage: NSObject {
    static let share = Storage()
    private override init() {
        super.init()
    }
    var allGroups = [Group]()
    var myGroups = [Group]()
    var myFriends = [Friend]()
    let token: String = ""
    let uerId: Int = 0
}
