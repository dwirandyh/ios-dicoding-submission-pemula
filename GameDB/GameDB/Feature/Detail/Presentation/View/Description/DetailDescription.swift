//
//  DetailDescription.swift
//  GameDB
//
//  Created by Dwi Randy Herdinanto on 22/06/20.
//  Copyright © 2020 dwirandyh. All rights reserved.
//

import UIKit
import Cosmos
import RxSwift
import GameDBCore

class DetailDescription: UIView {
    
    let disposeBag: DisposeBag = DisposeBag()
    var gameObservable: Observable<Game>
    
    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "The Jungle Book (2016)"
        label.font = ResourceHelper.Typography.Body.bold20
        label.textColor = ResourceHelper.Color.primaryTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var playTimeLabel: PaddingLabel = {
        let label: PaddingLabel = PaddingLabel()
        label.text = "105 min"
        label.layer.cornerRadius = ResourceHelper.Spacing.small
        label.layer.masksToBounds = true
        label.font = ResourceHelper.Typography.Body.regular10
        label.backgroundColor = ResourceHelper.Color.orange
        label.textColor = ResourceHelper.Color.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titleStackView: UIStackView = {
        let view: UIStackView = UIStackView()
        view.axis = .horizontal
        view.distribution = .fill
        view.spacing = ResourceHelper.Spacing.small
        view.alignment = .leading
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addArrangedSubview(self.titleLabel)
        view.addArrangedSubview(self.playTimeLabel)
        return view
    }()
    
    private lazy var genreLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Adventure, Drama, Family"
        label.font = ResourceHelper.Typography.Body.regular14
        label.textColor = ResourceHelper.Color.secondaryTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ratingView: CosmosView = {
        let view: CosmosView = CosmosView()
        view.rating = 5
        view.settings.starSize = 28
        view.settings.emptyColor = ResourceHelper.Color.grey
        view.settings.emptyBorderColor = ResourceHelper.Color.grey
        view.settings.filledBorderColor = ResourceHelper.Color.orange
        view.settings.filledColor = ResourceHelper.Color.orange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var ratingNumberLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "0.0"
        label.textColor = ResourceHelper.Color.orange
        label.font = ResourceHelper.Typography.Body.bold24
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var maxRatingLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "/5"
        label.textColor = ResourceHelper.Color.grey
        label.font = ResourceHelper.Typography.Caption.caption
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ratingStackView: UIStackView = {
        let view: UIStackView = UIStackView()
        view.axis = .horizontal
        view.distribution = .fill
        view.spacing = ResourceHelper.Spacing.small
        view.alignment = .firstBaseline
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addArrangedSubview(self.ratingView)
        view.addArrangedSubview(self.ratingNumberLabel)
        view.addArrangedSubview(self.maxRatingLabel)
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Grand Theft Auto V is a 2013 action-adventure game developed by Rockstar North and published by Rockstar Games. It is the first main entry in the Grand Theft Auto series since 2008's Grand Theft Auto IV."
        label.font = ResourceHelper.Typography.Body.regular14
        label.textColor = ResourceHelper.Color.secondaryTextColor
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var containerStackView: UIStackView = {
        let view: UIStackView = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = ResourceHelper.Spacing.small
        view.alignment = .leading
        
        view.translatesAutoresizingMaskIntoConstraints = false
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
        self.addSubview(self.containerStackView)
        self.containerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: ResourceHelper.Spacing.base).isActive = true
        self.containerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -ResourceHelper.Spacing.base).isActive = true
        self.containerStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        self.containerStackView.addArrangedSubview(self.titleStackView)
        self.containerStackView.addArrangedSubview(self.genreLabel)
        self.containerStackView.addArrangedSubview(self.ratingStackView)
        self.containerStackView.addArrangedSubview(self.descriptionLabel)
    }
    
    private func setupObserver(){
        self.gameObservable.subscribe(onNext: { (game) in
            self.displayData(game: game)
        }).disposed(by: self.disposeBag)
    }
    
    private func displayData(game: Game){
        self.titleLabel.text = game.name
        self.playTimeLabel.text = "\(game.playtime ?? 0) hours"
        self.ratingNumberLabel.text = "\(String(format: "%.1f", game.rating ?? 0))"
        self.ratingView.rating = Double(game.rating ?? 0)
        if let description = game.description {
            self.descriptionLabel.text = description.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        }
    }
    
}
