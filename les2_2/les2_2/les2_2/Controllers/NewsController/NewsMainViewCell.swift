//
//  NewsMainViewCell.swift
//  les2_2
//
//  Created by Роман Чикишев on 21.04.2022.
//

import UIKit

class NewsMainViewCell: UITableViewCell {


    @IBOutlet weak var countViews: UIView!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var postData: UILabel!
    @IBOutlet weak var textNews: UITextView!
    @IBOutlet weak var colletcionPhoto: UICollectionView!
    
    var collection: [CollectionCellModel] = []
    
 
}

// MARK: Collection view extension

extension NewsMainViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func updateCellWith(collection: [CollectionCellModel]) {
        self.collection = collection
        self.colletcionPhoto.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collection.count > 2 {
            return 2
        }else{
            return collection.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let collectionCell = collection[indexPath.row]
        cell.configure(with: collectionCell.image)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}
