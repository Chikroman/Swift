//
//  CollectionViewCell.swift
//  les2_2
//
//  Created by Роман Чикишев on 21.04.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var newsImage: UIImageView!
    
    func configure(with image: UIImage) {
        newsImage.image = image
    }

}
