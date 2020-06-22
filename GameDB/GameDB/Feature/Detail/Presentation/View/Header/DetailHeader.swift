//
//  DetailHeader.swift
//  GameDB
//
//  Created by Dwi Randy Herdinanto on 21/06/20.
//  Copyright © 2020 dwirandyh. All rights reserved.
//

import UIKit
import RxSwift
import GameDBCore
import SDWebImage

class DetailHeader: UIView {
    
    let disposeBag: DisposeBag = DisposeBag()
    var gameObservable: Observable<Game>
    
    private lazy var backgroundView: UIView = {
        let container: UIView = UIView()
        container.backgroundColor = .clear
        
        container.addSubview(self.backgroundImageView)
        backgroundImageView.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        backgroundImageView.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        
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
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ResourceHelper.Image.placeholder
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var posterImageView: UIImageView = {
        let view: UIImageView = UIImageView()
        view.image = ResourceHelper.Image.placeholder
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.8
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 8
        
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 150).isActive = true
        view.heightAnchor.constraint(equalToConstant: 210).isActive = true
        return view
    }()
    
    init(observable: Observable<Game>){
        self.gameObservable = observable
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.setupView()
        self.setupObserver()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    private func setupObserver(){
        self.gameObservable.subscribe(onNext: { (game) in
            self.displayData(game: game)
        }).disposed(by: self.disposeBag)
    }
    
    private func displayData(game: Game){
        if let background = game.backgroundImageAdditional, !background.isEmpty {
            self.backgroundImageView.sd_setImage(with: URL(string: background), placeholderImage: UIImage(named: "placeholder"))
        }
        
        if let poster = game.backgroundImage, !poster.isEmpty {
            self.posterImageView.sd_setImage(with: URL(string: poster), placeholderImage: UIImage(named: "placeholder"))
        }
    }
}
