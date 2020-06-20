//
//  ViewController.swift
//  GameDB
//
//  Created by Dwi Randy Herdinanto on 02/06/20.
//  Copyright © 2020 dwirandyh. All rights reserved.
//

import UIKit
import RxSwift
import GameDBCore

class HomeViewController: BaseViewController<HomeViewModel> {
    
    lazy var searchBar: UISearchBar = {
        let searchBar: UISearchBar = UISearchBar()
        searchBar.backgroundColor = ResourceHelper.Color.cardBackgroundColor
        searchBar.placeholder = "Search game here"
        searchBar.tintColor = ResourceHelper.Color.green
        searchBar.searchBarStyle = .minimal
        return searchBar
    }()
    
    lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(GameViewCell.self, forCellReuseIdentifier: "GameView")
        return tableView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = ResourceHelper.Spacing.small
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.gatRecommendationGame()
    }
    
    override open func setupView() {
        super.setupView()
        self.title = "Game DB"
        
        self.view.backgroundColor = ResourceHelper.Color.backgroundColor
        self.view.addSubview(self.stackView)
        self.stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        self.stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        self.stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        self.stackView.addArrangedSubview(self.searchBar)
        self.stackView.addArrangedSubview(self.tableView)
    }
    
    override open func setupObserver() {
        super.setupObserver()
        
        self.viewModel.gameListObservable.bind(to: self.tableView.rx.items(cellIdentifier: "GameView", cellType: GameViewCell.self)) { (row, element, cell) in
            cell.displayData(item: element)
        }.disposed(by: self.disposeBag)
        
        searchBar.rx.text
            .orEmpty
            .throttle(.milliseconds(300), latest: true, scheduler: MainScheduler.instance)
            .skip(1)
            .subscribe(onNext: { (query) in
                if query.isEmpty {
                    self.viewModel.gatRecommendationGame()
                } else {
                    self.viewModel.searchGame(query: query)
                }
            })
            .disposed(by: self.disposeBag)
    }
}

