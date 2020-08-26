//
//  TestViewController.swift
//  GameDB
//
//  Created by Dwi Randy Herdinanto on 26/08/20.
//  Copyright © 2020 dwirandyh. All rights reserved.
//

import UIKit
import GameDBCore

class TestViewController: BaseViewController<HomeViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupView()
    }

    override func setupView(){
        self.view.backgroundColor = .blue
    }

    @objc func injected() {
        setupView()
    }

}
