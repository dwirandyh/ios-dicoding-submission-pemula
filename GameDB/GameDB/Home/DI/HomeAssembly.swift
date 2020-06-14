//
//  HomeAssembly.swift
//  GameDB
//
//  Created by Dwi Randy Herdinanto on 07/06/20.
//  Copyright © 2020 dwirandyh. All rights reserved.
//

import Foundation
import Swinject
import GameDBCore

class HomeAssembly: Assembly {
    func assemble(container: Container) {
        container.register(HomeViewModel.self) { (resolver) in
            let repository = resolver.resolve(GameRepository.self)
            return HomeViewModel(repository: repository!)
        }
        container.register(HomeViewController.self) { (resolver) in
            let viewModel = resolver.resolve(HomeViewModel.self)
            return HomeViewController(viewModel: viewModel!)
        }
    }
}
