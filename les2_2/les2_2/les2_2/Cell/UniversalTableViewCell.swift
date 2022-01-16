//
//  UniversalTableViewCell.swift
//  les2_2
//
//  Created by Роман Чикишев on 13.01.2022.
//

import UIKit

class UniversalTableViewCell: UITableViewCell {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var nameLableView: UILabel!
    
    @IBOutlet weak var descriptoinLableView: UILabel!
    
    override func prepareForReuse() {
        mainImageView.image = nil
        nameLableView.text = nil
        descriptoinLableView.text = nil
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configurate(image: UIImage?, name: String?, description: String?){
        mainImageView.image = image
        nameLableView.text = name
        descriptoinLableView.text = description
    }
    func configurate(friend: Friend){
        mainImageView.image = UIImage(named: friend.avatar)
        nameLableView.text = friend.name
        descriptoinLableView.text = ""
    }
    func configurate(group: Group){
        mainImageView.image = UIImage(named: group.avatar)
        nameLableView.text = group.name
        descriptoinLableView.text = group.description
    }
}
