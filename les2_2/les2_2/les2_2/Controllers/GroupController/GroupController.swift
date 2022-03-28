//
//  GroupController.swift
//  les2_2
//
//  Created by Роман Чикишев on 13.01.2022.
//

import UIKit
import RealmSwift
import Firebase

class GroupController: UIViewController {
    
    var groups: Results<Groups>? {
        realmCacheServise.read(object: Groups.self)
    }
    
    let realmCacheServise = RealmCacheService()
    
    private var token: NotificationToken?
    private let fireBaseServise = [FirebaseGroups]()
    private let ref = Database.database().reference(withPath: "Groups")
    
    @IBOutlet weak var tableViewMyGroups: UITableView!
    
    let reuseIdentifierUniversalTableViewCell = "reuseIdentifierUniversalTableViewCell"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableViewMyGroups.reloadData()
        
        ref.observe(.value) { snapshot in
            var groups: [FirebaseGroups] = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                   let group = FirebaseGroups(snapshot: snapshot) {
                    groups.append(group)
                }
            }
            groups.forEach {print($0.groupName)}
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewMyGroups.dataSource = self
        tableViewMyGroups.delegate = self
        tableViewMyGroups.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierUniversalTableViewCell)
        fetchGroups()
        createNotificationToken()
 //       loadGruopsFromRealm()
    }
    private let jsonDecoder = JSONDecoder()
    
    func loadGroups(completion: @escaping(Result<Group, ServiceError>) -> ()){
        let queryItemsGroup = [
            URLQueryItem(name: "access_token", value: Storage.share.token),
            URLQueryItem(name: "v", value: "5.81")]
        UniversalMetod().loadJson(path: "/method/groups.get", queryItems: queryItemsGroup)
        guard let data = Storage.share.datafile else {return}

        do {
            let result = try self.jsonDecoder.decode(Group.self, from: data )
                completion(.success(result))
        } catch {
                completion(.failure(.parseError))
        }
    }
}

private extension GroupController {
    
    func fetchGroups() {
        loadGroups { [weak self] groups in
            guard let self = self else { return }
            do {
                let arrayGroup = try groups.get().response.items
                arrayGroup.forEach { group in
                    let firebaseGroup = FirebaseGroups (groupName: group.name, groupId: group.id)
                    let groupsRef = self.ref.child(group.name.lowercased())
                    groupsRef.setValue(firebaseGroup.toAnyObject)
                }
                
                DispatchQueue.main.async {
                    self.saveGroupsInrealm(newGroups: arrayGroup)
                 //   self.realmCacheServise.create(objects: arrayGroup)
                    
                }
                
                    //self.groups = arrayGroup
            }
            catch { }
            DispatchQueue.main.async {
                self.tableViewMyGroups.reloadData()
            }
        }
    }
//    func loadGruopsFromRealm() {
//        DispatchQueue.main.async {
//            private let mygroups = self.realmCacheServise.read(object: Groups.self)
//            mygroups.forEach { self.groups.append($0) }
//            self.tableViewMyGroups.reloadData()
//        }
//    }
    func createNotificationToken() {
        token = groups?.observe { [weak self] result in
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
                    self.tableViewMyGroups.beginUpdates()
                    self.tableViewMyGroups.deleteRows(at: deletionIndexPath, with: .automatic)
                    self.tableViewMyGroups.insertRows(at: insertionsIndexPath, with: .automatic)
                    self.tableViewMyGroups.reloadRows(at: modificationsIndexPath, with: .automatic)
                    self.tableViewMyGroups.endUpdates()
                }
            case .error(let error):
                print("\(error)")
            }
        }
    }
    
    func saveGroupsInrealm(newGroups: [Groups]) {
        do {
            let realm = try Realm()
            let oldValues = realm.objects(Groups.self)
            realm.beginWrite()
            realm.delete(oldValues)
            realm.add(newGroups)
            try realm.commitWrite()
        } catch {
            print("error \(error)")
        }
    }
    
}
