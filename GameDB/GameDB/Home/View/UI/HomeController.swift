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

protocol HomeView {
    func setupObserver()
}

class HomeViewController: UIViewController {
    
    let disposeBag: DisposeBag = DisposeBag()
    var homeViewModel: HomeViewModel!
    
    lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(GameViewCell.self, forCellReuseIdentifier: "GameView")
        return tableView
    }()
    
    init(viewModel: HomeViewModel){
        self.homeViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.homeViewModel = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        self.setupObserver()
        
        self.homeViewModel.getMovies()
    }
}

extension HomeViewController {
    func setupView(){
        self.title = "Game DB"
        
        self.view.backgroundColor = ResourceHelper.Color.backgroundColor
        self.view.addSubview(self.tableView)
        self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
}


extension HomeViewController: HomeView {
    func setupObserver(){
        self.homeViewModel.gameList.bind(to: self.tableView.rx.items(cellIdentifier: "GameView", cellType: GameViewCell.self)) { (row, element, cell) in
            cell.bindView(item: element)
        }.disposed(by: self.disposeBag)
    }
    
}
