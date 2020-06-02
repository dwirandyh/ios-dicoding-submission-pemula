//
//  ViewController.swift
//  GameDB
//
//  Created by Dwi Randy Herdinanto on 02/06/20.
//  Copyright © 2020 dwirandyh. All rights reserved.
//

import UIKit
import GameDBCore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let example: ExampleRepository = ExampleRepository()
        example.showMessage()
    }


}

