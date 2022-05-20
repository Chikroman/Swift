//
//  GroupsController+TableSourse.swift
//  les2_2
//
//  Created by Роман Чикишев on 13.01.2022.
//

import UIKit

extension GroupController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let mygroups = groups {
            return mygroups.count
        } else {
            return 0 
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierUniversalTableViewCell, for: indexPath) as? UniversalTableViewCell else {return UITableViewCell()}
        let section = getCellDateText(forIndexPath: indexPath)
        let name = section.name
        cell.nameLableView.text = name
        return cell
    }
    
    func getCellDateText(forIndexPath indexPath: IndexPath) -> Groups {
        if let section = dateTextCache[indexPath] {
            return section
        } else {
            if let mygroups = groups {
                let section = mygroups[indexPath.section]
                dateTextCache[indexPath] = section
                return section
            }
        }
        return Groups()
    }
}
