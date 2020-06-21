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
        container.register(HomeRouter.self) { (resolver) in
            return HomeRouterImpl()
        }
        
        container.register(HomeViewModel.self) { (resolver) in
            let repository = resolver.resolve(GameRepository.self)
            return HomeViewModel(repository: repository!)
        }
        container.register(HomeViewController.self) { (resolver) in
            let viewModel = resolver.resolve(HomeViewModel.self)
            let router = resolver.resolve(HomeRouter.self)
            return HomeViewController(viewModel: viewModel!, router: router!)
        }
    }
}
