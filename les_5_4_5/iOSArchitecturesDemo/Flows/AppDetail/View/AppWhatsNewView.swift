//
//  AppWhatsNewView.swift
//  iOSArchitecturesDemo
//
//  Created by Роман Чикишев on 01.07.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class AppWhatsNewView: UIView {
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 2
        return label
    }()
    
    private(set) lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupLayout()
    }
    private func setupLayout() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.subtitleLabel)
        NSLayoutConstraint.activate([

            
            self.titleLabel.topAnchor.constraint(equalTo:
                                                    self.safeAreaLayoutGuide.topAnchor, constant: 12.0),
            self.titleLabel.leftAnchor.constraint(equalTo:
                                                    self.imageView.rightAnchor, constant: 16.0),
            self.titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor,
                                                   constant: -16.0),
            
            self.subtitleLabel.topAnchor.constraint(equalTo:
                                                        self.titleLabel.bottomAnchor, constant: 12.0),
            self.subtitleLabel.leftAnchor.constraint(equalTo:
                                                        self.titleLabel.leftAnchor),
            self.subtitleLabel.rightAnchor.constraint(equalTo:
                                                        self.titleLabel.rightAnchor)
        ])
    }
}
