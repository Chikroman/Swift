//
//  FriendsListController.swift
//  les2_2
//
//  Created by Роман Чикишев on 13.01.2022.
//

import UIKit
enum ServiceError: Error {
    case parseError
    case serverError
}
class FriendsListController: UIViewController {

    @IBOutlet weak var tableViewMyFriends: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    

    var friends = [Friends]()
    let reuseIdentifierUniversalTableViewCell = "reuseIdentifierUniversalTableViewCell"
    let fromMyFriendToGallery = "fromMyFriendToGallery"
    let realmCacheServise = RealmCacheService()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            tableViewMyFriends.dataSource = self
            tableViewMyFriends.delegate = self
            tableViewMyFriends.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierUniversalTableViewCell)
//            searchBar.delegate = self
//            friends = sourceFriends
            fetchFriends()
            loadFriendsFromRealm()
        }
    
    func loadFriends(completion: @escaping(Result<Friend, ServiceError>) -> ()){
        let queryItemsFrends = [
            URLQueryItem(name: "access_token", value: Storage.share.token),
            URLQueryItem(name: "fields", value: "photo_50"),
            URLQueryItem(name: "v", value: "5.81")]
        UniversalMetod().loadJson(path: "/method/friends.get", queryItems: queryItemsFrends)
            let jsonDecoder = JSONDecoder()

            do {
                let result = try jsonDecoder.decode(Friend.self, from: Storage.share.datafile as! Data)
                
                return completion(.success(result))
            } catch {
                completion(.failure(.parseError))
            }

    }
}

private extension FriendsListController {
    func fetchFriends() {
        loadFriends { [weak self] friends in
            guard let self = self else { return }
            do {
                let arrayFriend = try friends.get().response.items
                DispatchQueue.main.async {
                    self.realmCacheServise.create(objects: arrayFriend)
                }
               // self.friends = arrayFriend
            }
            catch { }
            DispatchQueue.main.async {
                self.tableViewMyFriends.reloadData()
            }
        }
    }

    func loadFriendsFromRealm() {
        DispatchQueue.main.async {
            let myFriends = self.realmCacheServise.read(object: Friends.self)
            myFriends.forEach { self.friends.append($0) }
            self.tableViewMyFriends.reloadData()
        }
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

