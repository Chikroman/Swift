//
//  AllGroupController.swift
//  les2_2
//
//  Created by Роман Чикишев on 13.01.2022.
//

import UIKit

class AllGroupController: UIViewController {

    @IBOutlet weak var allGroupTableVew: UITableView!
    
    let reuseIdentifierUniversalTableViewCell = "reuseIdentifierUniversalTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allGroupTableVew.dataSource = self
        allGroupTableVew.delegate = self
        allGroupTableVew.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierUniversalTableViewCell)
    }
    


}
