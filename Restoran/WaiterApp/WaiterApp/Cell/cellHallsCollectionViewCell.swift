//
//  cellHallsCollectionViewCell.swift
//  WaiterApp
//
//  Created by Роман Чикишев on 07.02.2022.
//

import UIKit

class cellHallsCollectionViewCell: UITableViewCell {

    @IBOutlet weak var nameHallLabel: UILabel!
    
   
    override func prepareForReuse() {
        nameHallLabel.text = nil

        
    }
    func configurate(hall: Hall){
        nameHallLabel.text = hall.name
    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
