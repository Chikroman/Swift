//
//  AppDetailHeaderViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Роман Чикишев on 01.07.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class AppDetailHeaderViewController: UIViewController {
    private let app: ITunesApp
    
    private let imageDownloader = ImageDownloader()
    
    lazy var appDetailHeaderView = AppDetailHeaderView {
        return self.view as! AppDetailHeaderView
    }
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = AppDetailHeaderView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
    }
    
    private func fillData() {
        downloadImage()
        appDetailHeaderView.titleLabel.text = app.appName
        appDetailHeaderView.subtitleLabel.text = app.company
        appDetailHeaderView.ratingLabel.text = app.averageRating.flatMap {"\($0)"}
    }
    
    private func downloadImage() {
        guard let url = app.iconUrl else {
            return
        }
        imageDownloader.getImage(fromUrl: url) { [weak self] (image, _) in
            self?.AppDetailHeaderView.imageView.image = image
            
        }
    }
}
