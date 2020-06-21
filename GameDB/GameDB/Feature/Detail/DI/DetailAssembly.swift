//
//  DetailAssembly.swift
//  GameDB
//
//  Created by Dwi Randy Herdinanto on 21/06/20.
//  Copyright © 2020 dwirandyh. All rights reserved.
//

import Foundation
import Swinject
import GameDBCore

class DetailAssembly: Assembly {
    func assemble(container: Container) {
        container.register(DetailViewModel.self) { (resolver) in
            return DetailViewModel()
        }
        container.register(DetailViewController.self) { (resolver) in
            let viewModel = resolver.resolve(DetailViewModel.self)
            return DetailViewController(viewModel: viewModel!)
        }
    }
}
