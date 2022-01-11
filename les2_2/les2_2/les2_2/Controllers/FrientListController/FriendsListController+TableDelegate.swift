//
//  FriendsListController+TableDelegate.swift
//  les2_2
//
//  Created by Роман Чикишев on 11.01.2022.
//

import UIKit

extension FriendsListController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForCellTableView
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print (friends[indexPath.row])
    }
}
