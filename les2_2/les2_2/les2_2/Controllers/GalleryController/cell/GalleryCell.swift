//
//  GalleryCell.swift
//  les2_2
//
//  Created by Роман Чикишев on 16.01.2022.
//

import UIKit

class GalleryCell: UICollectionViewCell {

    @IBOutlet weak var fotoImageView: UIImageView!
    
    override func prepareForReuse() {
        fotoImageView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(fotoPath: String){
        fotoImageView.image = UIImage(named: fotoPath)
    }
}
