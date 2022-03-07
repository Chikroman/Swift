//
//  GroupController.swift
//  les2_2
//
//  Created by Роман Чикишев on 13.01.2022.
//

import UIKit

class GroupController: UIViewController {
    var groups: [Groups] = []
    
    let realmCacheServise = RealmCacheService()

    @IBOutlet weak var tableViewMyGroups: UITableView!
    
    let reuseIdentifierUniversalTableViewCell = "reuseIdentifierUniversalTableViewCell"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableViewMyGroups.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewMyGroups.dataSource = self
        tableViewMyGroups.delegate = self
        tableViewMyGroups.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierUniversalTableViewCell)
        fetchGroups()
        loadGruopsFromRealm()
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
                DispatchQueue.main.async {
                    self.realmCacheServise.create(objects: arrayGroup)
                }
                
                    //self.groups = arrayGroup
            }
            catch { }
            DispatchQueue.main.async {
                self.tableViewMyGroups.reloadData()
            }
        }
    }
    func loadGruopsFromRealm() {
        DispatchQueue.main.async {
            let mygroups = self.realmCacheServise.read(object: Groups.self)
            mygroups.forEach { self.groups.append($0) }
            self.tableViewMyGroups.reloadData()
        }
    }
}
