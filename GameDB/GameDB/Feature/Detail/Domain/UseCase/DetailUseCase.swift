//
//  DetailUseCase.swift
//  GameDB
//
//  Created by Dwi Randy Herdinanto on 17/07/20.
//  Copyright © 2020 dwirandyh. All rights reserved.
//

import Foundation
import RxSwift
import GameDBCore

protocol DetailUseCase {
    func getGameDetail(slug: String) -> Observable<Game>
}

class DetailUseCaseImpl: DetailUseCase {

    var gameRepository: GameRepository

    init(gameRepository: GameRepository){
        self.gameRepository = gameRepository
    }

    func getGameDetail(slug: String) -> Observable<Game> {
        return self.gameRepository.getGameDetail(slug: slug)
    }
}
