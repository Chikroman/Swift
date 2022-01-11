//
//  GroupsController.swift
//  les2_2
//
//  Created by Роман Чикишев on 11.01.2022.
//

import UIKit

class GroupsController: UIViewController {

    
    @IBOutlet weak var tableViewMyGroups: UITableView!
    
    let reuseIdentifierUniversalTableViewCell = "reuseIdentifierUniversalTableViewCell"
    
    let MyGroups = ["Pervaya","Vtoraya","Tretiya"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewMyGroups.dataSource = self
        tableViewMyGroups.delegate = self
        tableViewMyGroups.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierUniversalTableViewCell)
    }


}
