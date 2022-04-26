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
            let operationQueue = OperationQueue()
            let friendAPiOperation = FriendAPiOperation()
            let friendParsing = FriendParsing()
            let friendDisplay = FriendDisplay(controller: self)
            operationQueue.addOperation(friendAPiOperation)
            friendParsing.addDependency(friendAPiOperation)
            operationQueue.addOperation(friendParsing)
            friendDisplay.addDependency(friendParsing)
            OperationQueue.main.addOperation(friendDisplay)
            
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

class FriendAPiOperation: Operation {
    
    override func main() {
        let queryItemsFrends = [
            URLQueryItem(name: "access_token", value: Storage.share.token),
            URLQueryItem(name: "fields", value: "photo_50"),
            URLQueryItem(name: "v", value: "5.81")]
        UniversalMetod().loadJson(path: "/method/friends.get", queryItems: queryItemsFrends)

    }
}
class FriendParsing: Operation {
    var friendList: [Friends] = []
    
    override func main() {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(Friend.self, from: Storage.share.datafile!)
            friendList.self = result.response.items
        } catch {
            
        }

    }
    
}

class FriendDisplay: Operation {
    var friendViewController: FriendsListController
    override func main() {
        do {
            guard let parsetFrienfList = dependencies.first as? FriendParsing,
                  let friendList = parsetFrienfList.friendList as? [Friends] else {return}
            DispatchQueue.main.async { [self] in
                self.friendViewController.saveFrendsInrealm(newFrends: friendList)
            }
        }
        catch { }
        DispatchQueue.main.async { [self] in
            self.friendViewController.tableViewMyFriends.reloadData()
        }
    }
    init(controller: FriendsListController) {
        self.friendViewController = controller
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
            let oldValues = realm.objects(Friends.self)
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

