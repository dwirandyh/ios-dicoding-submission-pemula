//
//  DetailViewModel.swift
//  GameDB
//
//  Created by Dwi Randy Herdinanto on 21/06/20.
//  Copyright © 2020 dwirandyh. All rights reserved.
//

import Foundation
import GameDBCore
import RxSwift
import RxCocoa

class DetailViewModel: BaseViewModel {
    var repository: GameRepository
    var gameObservable: BehaviorRelay<Game> = BehaviorRelay<Game>(value: Game.defaultValue)
    
    init(repository: GameRepository) {
        self.repository = repository
        super.init()
    }
    
    func getGameDetail(slug: String){
        self.loadingObservable.accept(true)
        self.repository.getGameDetail(slug: slug)
            .subscribe(onNext: { (game) in
                self.gameObservable.accept(game)
                self.loadingObservable.accept(false)
            }).disposed(by: self.disposeBag)
    }
}
