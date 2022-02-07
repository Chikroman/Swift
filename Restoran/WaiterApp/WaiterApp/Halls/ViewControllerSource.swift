//
//  ViewControllerSource.swift
//  WaiterApp
//
//  Created by Роман Чикишев on 07.02.2022.
//

import UIKit

extension ViewController: UITableViewDataSource {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Storage.share.allHall.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifiercellHallsCollectionViewCell, for: indexPath) as? cellHallsCollectionViewCell else {return UITableViewCell()}
        
        cell.configurate(hall: Storage.share.allHall[indexPath.row])
//        cell.configurate(image: nil, name: Storage.share.myGroups[indexPath.row], description: nil)
        
        return cell
    }
}
