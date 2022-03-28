//
//  FirebaseGroups.swift
//  les2_2
//
//  Created by Роман Чикишев on 28.03.2022.
//

import Firebase

class FirebaseGroups {
    let groupName: String
    let groupId: Int
    let ref: DatabaseReference?
    
    init(groupName: String, groupId: Int) {
        self.ref = nil
        self.groupId = groupId
        self.groupName = groupName
    }
    init?(snapshot: DataSnapshot) {
        guard let value = snapshot.value as? [String: Any],
              let id = value["groupId"] as? Int,
              let name = value["groupName"] as? String
        else {
            return nil
        }
        self.ref = snapshot.ref
        self.groupId = id
        self.groupName = name
    }
    
    func toAnyObject() -> [String: Any] {
        ["groupId": groupId,
         "groupName": groupName]
    }
}
