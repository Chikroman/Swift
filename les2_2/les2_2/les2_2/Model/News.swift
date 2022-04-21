//
//  News.swift
//  les2_2
//
//  Created by Роман Чикишев on 21.04.2022.
//

import Foundation
import UIKit

struct NewsCellModel {
    
    var nameFriend: FriendModel
    var postDate: String
    var postText: String
    var newsImageNames: [String]
    var collection: [CollectionCellModel] = []
    
    init(nameFriend: FriendModel, postDate: String, postText: String, newsImageNames: [String]) {
        self.nameFriend = nameFriend
        self.postDate = postDate
        self.postText = postText
        self.newsImageNames = newsImageNames
        
        for newsImage in newsImageNames {
            guard let image = UIImage(named: newsImage) else {continue}
            self.collection.append(CollectionCellModel(image: image))
        }
    }
}

struct CollectionCellModel {
    var image: UIImage
}

struct FriendModel {
    let name: String
    let image: String
    let uiImage: UIImage
    var friendsPhoto: [UIImage] = []
    
    init(name: String, image: String, friendsPhoto: [String]) {
        self.name = name
        self.image = image
        
        uiImage = UIImage(named: image) ?? UIImage()
        
        // массив фоток друзей из имен фоток
        for friendsPhoto in friendsPhoto {
            guard let image = UIImage(named: friendsPhoto) else {continue}
            self.friendsPhoto.append(image)
        }
    }
}
