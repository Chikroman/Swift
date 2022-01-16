//
//  FriendsListController.swift
//  les2_2
//
//  Created by Роман Чикишев on 13.01.2022.
//

import UIKit

class FriendsListController: UIViewController {

    @IBOutlet weak var tableViewMyFriends: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var sourceFriends = Storage.share.myFriends
    var friends = [Friend]()
    let reuseIdentifierUniversalTableViewCell = "reuseIdentifierUniversalTableViewCell"
    let fromMyFriendToGallery = "fromMyFriendToGallery"
    
        override func viewDidLoad() {
            super.viewDidLoad()
            tableViewMyFriends.dataSource = self
            tableViewMyFriends.delegate = self
            tableViewMyFriends.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierUniversalTableViewCell)
//            searchBar.delegate = self
            friends = sourceFriends
        }
}

//extension FriendsListController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchText.isEmpty {
//            friends = sourceFriends
//        }
//        else {
//            friends = sourceFriends.filter({sourceFriendsItem in
//                sourceFriendsItem.lowercased().contains(searchText.lowercased())
//            })
//        }
//        tableViewMyFriends.reloadData()
//    }
//}
