//
//  GameViewCell.swift
//  GameDB
//
//  Created by Dwi Randy Herdinanto on 07/06/20.
//  Copyright © 2020 dwirandyh. All rights reserved.
//

import UIKit
import GameDBCore
import SDWebImage

class GameViewCell: UITableViewCell {
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.addShadow()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = ResourceHelper.Spacing.tiny
        imageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = ResourceHelper.Typography.Body.bold16
        label.textColor = ResourceHelper.Color.primaryTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var genreLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = ResourceHelper.Typography.Body.regular14
        label.textColor = ResourceHelper.Color.secondaryTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var playTimeLabel: PaddingLabel = {
        let label: PaddingLabel = PaddingLabel()
        label.layer.cornerRadius = ResourceHelper.Spacing.small
        label.layer.masksToBounds = true
        label.font = ResourceHelper.Typography.Body.regular10
        label.backgroundColor = ResourceHelper.Color.orange
        label.textColor = ResourceHelper.Color.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ratingLabel: PaddingLabel = {
        let label: PaddingLabel = PaddingLabel(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        label.textAlignment = .center
        label.layer.cornerRadius = label.frame.width / 2
        label.layer.masksToBounds = true
        label.font = ResourceHelper.Typography.Body.bold14
        label.textColor = ResourceHelper.Color.white
        label.backgroundColor = ResourceHelper.Color.green
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: label.frame.width).isActive = true
        label.heightAnchor.constraint(equalToConstant: label.frame.height).isActive = true
        return label
    }()
    
    private lazy var pcImage: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.image = ResourceHelper.Image.pc
        imageView.isHidden = true
        imageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 14).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var playStationImage: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.image = ResourceHelper.Image.playStation
        imageView.isHidden = true
        imageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 14).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var xboxImage: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.image = ResourceHelper.Image.xbox
        imageView.isHidden = true
        imageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 14).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var emptyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentStackView: UIStackView =  {
        let stackView: UIStackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = ResourceHelper.Spacing.tiny
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var cardView: UIView = {
        let view: UIView = UIView()
        view.addShadow()
        view.backgroundColor = ResourceHelper.Color.cardBackgroundColor
        view.layer.cornerRadius = ResourceHelper.Spacing.tiny
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var platformView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = ResourceHelper.Spacing.small
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(self.pcImage)
        stackView.addArrangedSubview(self.playStationImage)
        stackView.addArrangedSubview(self.xboxImage)
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension GameViewCell {
    private func setupView(){
        self.backgroundColor = .clear
        self.contentView.backgroundColor = ResourceHelper.Color.backgroundColor
        
        self.contentView.addSubview(self.cardView)
        self.cardView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: ResourceHelper.Spacing.large).isActive = true
        self.cardView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: ResourceHelper.Spacing.base).isActive = true
        self.cardView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -ResourceHelper.Spacing.base).isActive = true
        self.cardView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -ResourceHelper.Spacing.small).isActive = true
        
        self.cardView.addSubview(self.backgroundImageView)
        self.backgroundImageView.leadingAnchor.constraint(equalTo: self.cardView.leadingAnchor, constant: ResourceHelper.Spacing.small).isActive = true
        self.backgroundImageView.bottomAnchor.constraint(equalTo: self.cardView.bottomAnchor, constant: -ResourceHelper.Spacing.small).isActive = true
        
        
        self.cardView.addSubview(self.contentStackView)
        
        self.contentStackView.topAnchor.constraint(equalTo: self.cardView.topAnchor, constant: ResourceHelper.Spacing.base).isActive = true
        self.contentStackView.leadingAnchor.constraint(equalTo: self.backgroundImageView.trailingAnchor, constant: ResourceHelper.Spacing.medium).isActive = true
        self.contentStackView.trailingAnchor.constraint(equalTo: self.cardView.trailingAnchor, constant: -ResourceHelper.Spacing.base).isActive = true
        self.contentStackView.bottomAnchor.constraint(equalTo: self.cardView.bottomAnchor, constant: -ResourceHelper.Spacing.base).isActive = true
        
        
        self.contentStackView.addArrangedSubview(self.titleLabel)
        self.contentStackView.addArrangedSubview(self.genreLabel)
        self.contentStackView.addArrangedSubview(self.playTimeLabel)
        self.contentStackView.addArrangedSubview(self.platformView)
        
        
        self.cardView.addSubview(self.ratingLabel)
        self.ratingLabel.bottomAnchor.constraint(equalTo: self.backgroundImageView.bottomAnchor, constant: -ResourceHelper.Spacing.tiny).isActive = true
        self.ratingLabel.trailingAnchor.constraint(equalTo: self.backgroundImageView.trailingAnchor, constant: self.ratingLabel.frame.width / 2).isActive = true
    }
}

extension GameViewCell {
    func displayData(item: Game){
        self.titleLabel.text = item.name
        self.genreLabel.text = "Action, Adventure"
        self.playTimeLabel.text = "\(item.playtime ?? 0) hours"
        self.ratingLabel.text = "\(String(format: "%.1f", item.rating ?? 0))"
        if let backgroundImage = item.backgroundImage {
            self.backgroundImageView.sd_setImage(with: URL(string: backgroundImage), placeholderImage: UIImage(named: "placeholder"))
        }
        
        self.displayPlatform(parentPlatform: item.parentPlatforms)
    }
    
    func displayPlatform(parentPlatform: [ParentPlatform]?){
        guard let parents = parentPlatform else { return }
        for parent in parents {
            let gamePlatform = GamePlatform(rawValue: parent.platform?.name ?? "")
            switch gamePlatform {
            case .pc:
                self.pcImage.isHidden = false
            case .playstation:
                self.playStationImage.isHidden = false
            case .xbox:
                self.xboxImage.isHidden = false
            case .none:
                break
            }
        }
    }
}
