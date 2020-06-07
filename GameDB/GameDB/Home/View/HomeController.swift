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

class HomeViewController: UIViewController {
    
    let disposeBag: DisposeBag = DisposeBag()
    var homeViewModel: HomeViewModel = HomeViewModel()
    
    private lazy var resultText: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        
        self.setupObserver()
        
        self.homeViewModel.getMovies()
    }
    
    func setupObserver(){
        self.homeViewModel.gameList.bind { (result) in
            self.resultText.text = "\(result.count)"
        }.disposed(by: self.disposeBag)
    }
    
    func setupView(){
        self.view.backgroundColor = .white
        self.view.addSubview(self.resultText)
        resultText.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        resultText.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}

