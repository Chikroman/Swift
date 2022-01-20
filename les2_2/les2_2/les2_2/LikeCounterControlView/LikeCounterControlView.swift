//
//  LikeCounterControlView.swift
//  les2_2
//
//  Created by Роман Чикишев on 19.01.2022.
//

import UIKit

@IBDesignable class LikeCounterControlView: UIView {

    @IBOutlet weak var heartButton: UIButton!
    
    @IBOutlet weak var countLabel: UILabel!
    private var view: UIView!
    
    var likeCounter = 0
    var isHeartEmpty = true
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func loadFromXib()-> UIView {
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: "LikeCounterControlView", bundle: bundle)
        guard let view = xib.instantiate(withOwner: self, options: nil).first as? UIView else {return UIView()}
        return view
        
    }
    func setup() {
        self.view = loadFromXib()
        self.view.frame = bounds
        self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(self.view)
    }

    @IBAction func pressHeartButton(_ sender: Any) {
        if isHeartEmpty {
            likeCounter += 1
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            
            
        }
        else {
            likeCounter -= 1
            heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        countLabel.text = String(likeCounter)
        isHeartEmpty = !isHeartEmpty
    }
}
