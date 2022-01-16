//
//  GroupController.swift
//  les2_2
//
//  Created by Роман Чикишев on 13.01.2022.
//

import UIKit

class GroupController: UIViewController {

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
    }


}
