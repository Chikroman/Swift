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
    
    var completion: (()->Void)?
    
    override func prepareForReuse() {
        mainImageView.image = nil
        nameLableView.text = nil
        descriptoinLableView.text = nil
        self.completion = nil
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        mainImageView.layer.cornerRadius = 43
        mainImageView.layer.borderWidth = 5
        mainImageView.layer.shadowColor = UIColor.black.cgColor
        mainImageView.layer.shadowOffset = CGSize(width: 40, height: 40)
        mainImageView.layer.shadowRadius = 15
        mainImageView.layer.shadowOpacity = 0.8
        // Initialization code
    }
    func configurate(image: UIImage?, name: String?, description: String?){
        mainImageView.image = image
        nameLableView.text = name
        descriptoinLableView.text = description
    }
    func configurate(friend: Friend, completion: @escaping()->Void){
        self.completion = completion
        mainImageView.image = UIImage(named: friend.avatar)
        nameLableView.text = friend.name
        descriptoinLableView.text = ""
    }
    func configurate(group: Group){
        mainImageView.image = UIImage(named: group.avatar)
        nameLableView.text = group.name
        descriptoinLableView.text = group.description
    }
    
    @IBAction func pressAnimationButton(_ sender: Any) {
        UIView.animate(withDuration: 3) {[weak self] in
            self?.mainImageView.frame = CGRect.zero
        } completion: {[weak self] _ in
            self?.completion?()
        }

    }
}
