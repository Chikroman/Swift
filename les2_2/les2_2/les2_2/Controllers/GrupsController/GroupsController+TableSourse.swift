//
//  GroupsController+TableSourse.swift
//  les2_2
//
//  Created by Роман Чикишев on 11.01.2022.
//

import UIKit

extension GroupsController: UITableViewDataSource {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyGroups.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierUniversalTableViewCell, for: indexPath) as? UniversalTableViewCell else {return UITableViewCell()}
        
        cell.configurate(image: nil, name: MyGroups[indexPath.row], description: nil)
        
        return cell
    }
}
