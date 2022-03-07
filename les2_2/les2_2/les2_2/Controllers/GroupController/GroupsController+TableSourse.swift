//
//  GroupsController+TableSourse.swift
//  les2_2
//
//  Created by Роман Чикишев on 13.01.2022.
//

import UIKit

extension GroupController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierUniversalTableViewCell, for: indexPath) as? UniversalTableViewCell else {return UITableViewCell()}
        let section = groups[indexPath.section]
        let name = section.name
        cell.nameLableView.text = name        
        return cell
    }
    

}
