//
//  FriendListController+TableDataSource.swift
//  les2_2
//
//  Created by Роман Чикишев on 13.01.2022.
//

import UIKit

extension FriendsListController: UITableViewDataSource {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let myFrends = friends {
            return myFrends.count
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierUniversalTableViewCell, for: indexPath) as? UniversalTableViewCell else {return UITableViewCell()}
        
//        cell.configurate(image: nil, name: friends[indexPath.row], description: nil)
//        cell.configurate(friend: friends[indexPath.row], completion: {[weak self] in
//            guard let self = self else {return}
//            self.performSegue(withIdentifier: self.fromMyFriendToGallery, sender: self.friends[indexPath.row])
//        })
        return cell
    }
}
