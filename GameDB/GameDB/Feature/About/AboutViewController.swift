//
//  AboutViewController.swift
//  GameDB
//
//  Created by Dwi Randy Herdinanto on 22/06/20.
//  Copyright © 2020 dwirandyh. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = ResourceHelper.Spacing.base
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.image = ResourceHelper.Image.profile
        imageView.layer.borderWidth = 1.0
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 200 / 2
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Dwi Randy Herdinanto"
        label.font = ResourceHelper.Typography.Heading.heading20
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "dwirandyherdinanto@gmail.com"
        label.font = ResourceHelper.Typography.Caption.caption
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.setupView()
    }
    
    
    private func setupView(){
        self.view.backgroundColor = ResourceHelper.Color.backgroundColor
        
        self.view.addSubview(self.stackView)
        self.stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.stackView.addArrangedSubview(self.profileImageView)
        self.stackView.addArrangedSubview(self.nameLabel)
        self.stackView.addArrangedSubview(self.emailLabel)
    }
}
