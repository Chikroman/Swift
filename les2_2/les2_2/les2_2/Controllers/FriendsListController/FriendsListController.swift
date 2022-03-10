//
//  FriendsListController.swift
//  les2_2
//
//  Created by Роман Чикишев on 13.01.2022.
//

import UIKit
import RealmSwift
enum ServiceError: Error {
    case parseError
    case serverError
}
class FriendsListController: UIViewController {

    @IBOutlet weak var tableViewMyFriends: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var token: NotificationToken?
    
    var friends: Results<Friends>? {
        realmCacheServise.read(object: Friends.self)
    }
    
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
            self.createNotificationToken()
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
                    self.saveFrendsInrealm(newFrends: arrayFriend)
                   // self.realmCacheServise.create(objects: arrayFriend)
                }
               // self.friends = arrayFriend
            }
            catch { }
            DispatchQueue.main.async {
                self.tableViewMyFriends.reloadData()
            }
        }
    }

    func createNotificationToken() {
        token = friends?.observe { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .initial(let groupsData):
                print("\(groupsData.count)")
            case .update(_ ,
                         deletions: let deletions,
                         insertions: let insertions,
                         modifications: let modifications):
                let deletionIndexPath = deletions.map { IndexPath(row: $0, section: 0) }
                let insertionsIndexPath = insertions.map { IndexPath(row: $0, section: 0) }
                let modificationsIndexPath = modifications.map { IndexPath(row: $0, section: 0) }
                DispatchQueue.main.async {
                    self.tableViewMyFriends.beginUpdates()
                    self.tableViewMyFriends.deleteRows(at: deletionIndexPath, with: .automatic)
                    self.tableViewMyFriends.insertRows(at: insertionsIndexPath, with: .automatic)
                    self.tableViewMyFriends.reloadRows(at: modificationsIndexPath, with: .automatic)
                    self.tableViewMyFriends.endUpdates()
                }
            case .error(let error):
                print("\(error)")
            }
        }
    }
    
    func saveFrendsInrealm(newFrends: [Friends]) {
        do {
            let realm = try Realm()
            let oldValues = realm.objects(Groups.self)
            realm.beginWrite()
            realm.delete(oldValues)
            realm.add(newFrends)
            try realm.commitWrite()
        } catch {
            print("error \(error)")
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

