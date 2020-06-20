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
    
    lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(GameViewCell.self, forCellReuseIdentifier: "GameView")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.getMovies()
    }
    
    override open func setupView() {
        super.setupView()
        self.title = "Game DB"
        
        self.view.backgroundColor = ResourceHelper.Color.backgroundColor
        self.view.addSubview(self.tableView)
        self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
    
    override open func setupObserver() {
        super.setupObserver()
        
        self.viewModel.gameListObservable.bind(to: self.tableView.rx.items(cellIdentifier: "GameView", cellType: GameViewCell.self)) { (row, element, cell) in
            cell.bindView(item: element)
        }.disposed(by: self.disposeBag)
    }
}


extension HomeViewController {
    
}
