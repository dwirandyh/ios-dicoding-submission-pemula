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
        container.register(DetailUseCase.self) { (resolver) in
            let gameRepository = resolver.resolve(GameRepository.self)
            return DetailUseCaseImpl(gameRepository: gameRepository!)
        }

        container.register(DetailViewModel.self) { (resolver) in
            let detailUseCase = resolver.resolve(DetailUseCase.self)
            return DetailViewModel(detailUseCase: detailUseCase!)
        }
        container.register(DetailViewController.self) { (resolver) in
            let viewModel = resolver.resolve(DetailViewModel.self)
            return DetailViewController(viewModel: viewModel!)
        }
    }
}
