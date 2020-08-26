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

        container.register(HomeUseCase.self) { (resolver) in
            let repository: GameRepository = resolver.resolve(GameRepository.self)!
            return HomeUseCaseImpl(gameRepository: repository)
        }
        
        container.register(HomeViewModel.self) { (resolver) in
            let homeUseCase: HomeUseCase = resolver.resolve(HomeUseCase.self)!
            return HomeViewModel(homeUseCase: homeUseCase)
        }
        container.register(HomeViewController.self) { (resolver) in
            let viewModel = resolver.resolve(HomeViewModel.self)
            let router = resolver.resolve(HomeRouter.self)
            return HomeViewController(viewModel: viewModel!, router: router!)
        }

        container.register(TestViewController.self) { (resolver) in
            let viewModel = resolver.resolve(HomeViewModel.self)
            return TestViewController(viewModel: viewModel!)
        }
    }
}
