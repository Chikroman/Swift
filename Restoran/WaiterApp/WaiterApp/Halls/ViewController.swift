//
//  ViewController.swift
//  WaiterApp
//
//  Created by Роман Чикишев on 07.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var listOfHalls: UITableView!
    let reuseIdentifiercellHallsCollectionViewCell = "reuseIdentifiercellHallsCollectionViewCell"
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listOfHalls.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fillAllHallsData()
        listOfHalls.dataSource = self
        listOfHalls.delegate = self
        listOfHalls.register(UINib(nibName: "cellHallsCollectionViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifiercellHallsCollectionViewCell)
    }
//    func fillFriendsData() {
//        let friends1 = Friend(name: "Des", avatar: "Des1", fotos: ["Des1","Des2"])
//        let friends2 = Friend(name: "Sidor", avatar: "Sidor1", fotos: ["Sidor1","Sidor2"])
//        Storage.share.myFriends.append(friends1)
//        Storage.share.myFriends.append(friends2)
//    }
    func fillAllHallsData() {
        var hall = Hall(group: "Основной зал", name: "Основной зал", thisGroup: true)
        Storage.share.allHall.append(hall)
        hall = Hall(group: "Малый зал", name: "Малый зал", thisGroup: true)
        Storage.share.allHall.append(hall)
    }

}

