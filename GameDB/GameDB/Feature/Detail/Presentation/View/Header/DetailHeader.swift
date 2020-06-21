//
//  DetailHeader.swift
//  GameDB
//
//  Created by Dwi Randy Herdinanto on 21/06/20.
//  Copyright © 2020 dwirandyh. All rights reserved.
//

import UIKit

class DetailHeader: UIView {

    
    private lazy var backgroundView: UIView = {
        let container: UIView = UIView()
        container.backgroundColor = .clear
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "img_background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(imageView)
        imageView.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        
        let overlay: UIView = UIView()
        overlay.backgroundColor = #colorLiteral(red: 0.1601605713, green: 0.1644997299, blue: 0.186186552, alpha: 0.7061750856)
        overlay.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(overlay)
        overlay.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        overlay.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        overlay.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        overlay.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        
        container.translatesAutoresizingMaskIntoConstraints = false
        
        return container
    }()
    
    private lazy var posterImageView: UIImageView = {
        let view: UIImageView = UIImageView()
        view.image = UIImage(named: "img_thumbnail")
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.8
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 8
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 150).isActive = true
        view.heightAnchor.constraint(equalToConstant: 210).isActive = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
    
    
    private func setupView(){
        self.addSubview(self.backgroundView)
        self.backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.backgroundView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -ResourceHelper.Spacing.medium).isActive = true
        
        self.addSubview(self.posterImageView)
        self.posterImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.posterImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: ResourceHelper.Spacing.base).isActive = true
    }
}
