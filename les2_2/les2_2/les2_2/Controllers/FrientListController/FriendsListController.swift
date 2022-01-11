//
//  FriendsListController.swift
//  les2_2
//
//  Created by Роман Чикишев on 11.01.2022.
//

import UIKit

class FriendsListController: UIViewController {

    @IBOutlet weak var tableViewFyFriends: UITableView!
    
    let reuseIdentifierUniversalTableViewCell = "reuseIdentifierUniversalTableViewCell"
    
    let friends = ["Des","Sidor","Erema"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewFyFriends.dataSource = self
        tableViewFyFriends.delegate = self
        tableViewFyFriends.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierUniversalTableViewCell)
    }
}
