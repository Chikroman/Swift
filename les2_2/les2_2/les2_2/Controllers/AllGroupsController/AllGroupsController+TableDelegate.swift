//
//  AllGroupsController+TableDelegate.swift
//  les2_2
//
//  Created by Роман Чикишев on 13.01.2022.
//

import UIKit

extension AllGroupController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForCellTableView
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print (Storage.share.allGroups[indexPath.row])
       // if !isAllreadyMyGroups(item: indexPath.row){
            Storage.share.myGroups.append(Storage.share.allGroups[indexPath.row])
        //}
    }
//    func isAllreadyMyGroups(item: Int) -> Bool {
//        return  Storage.share.myGroups.contains { myGroupsItem in myGroupsItem == Storage.share.allGroups[item]}
//    } 
}
