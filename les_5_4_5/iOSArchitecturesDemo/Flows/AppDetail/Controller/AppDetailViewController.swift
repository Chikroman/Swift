//
//  AppDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 20.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppDetailViewController: UIViewController {
    
    public var app: ITunesApp?

    lazy var headerViewController = AppDetailHeaderViewController(app: self.app)
    
    lazy var appWhatsNewViewController = AppWhatsNewViewController(app: self.app)
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    private var appDetailView: AppDetailView {
        return self.view as! AppDetailView
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = AppDetailView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    private func configureUI() {
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationItem.largeTitleDisplayMode = .never
        self.addHeaderViewController()
        self.addDescriptionViewController()
        self.addHeaderViewController()
    }
    
    private func addHeaderViewController() {
        self.addChild(self.headerViewController)
        self.view.addSubview(self.headerViewController.view)
        self.headerViewController.didMove(toParent: self)
        self.headerViewController.view.translatesAutoresizingMaskIntoConstraints
        = false
        NSLayoutConstraint.activate([
            self.headerViewController.view.topAnchor.constraint(equalTo:
                                                                    self.view.safeAreaLayoutGuide.topAnchor),
            self.headerViewController.view.leftAnchor.constraint(equalTo:
                                                                    self.view.leftAnchor),
            self.headerViewController.view.rightAnchor.constraint(equalTo:
                                                                    self.view.rightAnchor)
        ])
    }
    
    private func addWhatsNewViewController() {
        self.addChild(self.appWhatsNewViewController)
        self.view.addSubview(self.appWhatsNewViewController.view)
        self.appWhatsNewViewController.didMove(toParent: self)
        self.appWhatsNewViewController.view.translatesAutoresizingMaskIntoConstraints
        = false
        NSLayoutConstraint.activate([
            self.appWhatsNewViewController.view.topAnchor.constraint(equalTo:
                                                                    self.headerViewController.safeAreaLayoutGuide.topAnchor),
            self.appWhatsNewViewController.view.leftAnchor.constraint(equalTo:
                                                                    self.view.leftAnchor),
            self.appWhatsNewViewController.view.rightAnchor.constraint(equalTo:
                                                                    self.view.rightAnchor)
        ])
    }
    
    private func addDescriptionViewController() {
        let descriptionViewController = UIViewController()
        self.addChild(descriptionViewController)
        self.view.addSubview(descriptionViewController.view)
        descriptionViewController.didMove(toParent: self)
        descriptionViewController.view.translatesAutoresizingMaskIntoConstraints
        = false
        NSLayoutConstraint.activate([
            descriptionViewController.view.topAnchor.constraint(equalTo:
                                                                    self.headerViewController.view.bottomAnchor),
            descriptionViewController.view.leftAnchor.constraint(equalTo:
                                                                    self.view.leftAnchor),
            descriptionViewController.view.rightAnchor.constraint(equalTo:
                                                                    self.view.rightAnchor),
            descriptionViewController.view.heightAnchor.constraint(equalToConstant: 250.0)])
    }
    
    
}
