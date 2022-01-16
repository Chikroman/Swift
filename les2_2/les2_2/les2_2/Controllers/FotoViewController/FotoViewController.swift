//
//  FotoViewController.swift
//  les2_2
//
//  Created by Роман Чикишев on 16.01.2022.
//

import UIKit

class FotoViewController: UIViewController {
    var foto = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(frame: CGRect(x: 0, y: self.view.bounds.height/2 - self.view.bounds.width / 2 , width: self.view.bounds.width, height: self.view.bounds.width))
        self.view.addSubview(imageView)
        imageView.image = UIImage(named: foto)
        // Do any additional setup after loading the view.
    }
    

}
