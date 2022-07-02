//
//  AppWhatsNewViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Роман Чикишев on 01.07.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class AppWhatsNewViewController: UIViewController {
    private let app: ITunesApp
    
    lazy var appWhatsNewView = AppWhatsNewView {
        return self.view as! AppWhatsNewView
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
        self.view = AppWhatsNewView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
    }
    
    private func fillData() {
        appDetailHeaderView.titleLabel.text = "Что нового"
        appDetailHeaderView.subtitleLabel.text = app.appDescription
    }
    
}
