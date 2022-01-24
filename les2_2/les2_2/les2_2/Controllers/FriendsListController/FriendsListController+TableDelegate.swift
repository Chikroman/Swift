//
//  FriendsListController+TableDelegate.swift
//  les2_2
//
//  Created by Роман Чикишев on 13.01.2022.
//

import UIKit

extension FriendsListController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForCellTableView
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == fromMyFriendToGallery,
           let destinationController = segue.destination as? GalleryController,
           let friend = sender as? Friend {
            destinationController.fotoArray = friend.fotos
            
        }
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print (friends[indexPath.row])
//        
//        performSegue(withIdentifier: fromMyFriendToGallery, sender: friends[indexPath.row])
//    }
}

