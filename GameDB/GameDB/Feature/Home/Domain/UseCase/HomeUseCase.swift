//
//  HomeUserCase.swift
//  GameDB
//
//  Created by Dwi Randy Herdinanto on 17/07/20.
//  Copyright © 2020 dwirandyh. All rights reserved.
//

import Foundation
import RxSwift
import GameDBCore

protocol HomeUseCase {
    func getGameList() -> Observable<[Game]>
    func searchGame(query: String) -> Observable<[Game]>
}

class HomeUseCaseImpl: HomeUseCase {

    var gameRepository: GameRepository

    init(gameRepository: GameRepository){
        self.gameRepository = gameRepository
    }

    func getGameList() -> Observable<[Game]> {
        self.gameRepository.getGameList()
    }

    func searchGame(query: String) -> Observable<[Game]> {
        self.gameRepository.searchGame(query: query)
    }
}
