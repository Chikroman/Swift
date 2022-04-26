//
//  News.swift
//  les2_2
//
//  Created by Роман Чикишев on 21.04.2022.
//

import UIKit
import RealmSwift

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


struct News: Decodable {
    let response: NewsResponse
}

struct NewsResponse: Decodable {
    let items: [NewsItem]
    let groups: [NewsGroup]
}

struct NewsItem: Decodable {
    let sourceID: Int
    let postID: Int
    let date: Double
    let text: String
    let comments: CountableItem
    let likes: Likes
    let reposts: CountableItem
    let views: CountableItem

    enum CodingKeys: String, CodingKey {
        case sourceID = "source_id"
        case postID = "post_id"
        case date
        case text
        case comments, likes, reposts, views
    }
}

struct CountableItem: Decodable {
    let count: Int
}

struct Likes: Decodable {
    let count: Int
    let userLikes: Int

    enum CodingKeys: String, CodingKey {
        case count
        case userLikes = "user_likes"
    }
}

struct NewsGroup: Decodable {
    let id: Int
    let name: String
    let photo50: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case photo50 = "photo_50"
    }
}

struct Attachment: Codable {
    let type: String
    let photo: Photo?
    let link: Link?
}


struct Link: Codable {
    let url: String
    let title, caption, linkDescription: String
    let photo: Photo
    let isFavorite: Bool

    enum CodingKeys: String, CodingKey {
        case url, title, caption
        case linkDescription = "description"
        case photo
        case isFavorite = "is_favorite"
    }
}


struct Photo: Codable {
    let albumID, date, id, ownerID: Int
    let sizes: [Size]
    let text: String
    let userID: Int
    let hasTags: Bool
    let accessKey: String?
    let postID: Int?

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case date, id
        case ownerID = "owner_id"
        case sizes, text
        case userID = "user_id"
        case hasTags = "has_tags"
        case accessKey = "access_key"
        case postID = "post_id"
    }
}

struct Size: Codable {
    let height: Int
    let url: String
    let type: String
    let width: Int
}
