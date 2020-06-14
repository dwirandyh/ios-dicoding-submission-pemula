//
//  HomeViewModel.swift
//  GameDB
//
//  Created by Dwi Randy Herdinanto on 07/06/20.
//  Copyright © 2020 dwirandyh. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import GameDBCore

class HomeViewModel {
    
    var repository: GameRepository
    let disposeBag: DisposeBag = DisposeBag()
    var gameList: BehaviorRelay<[Game]> = BehaviorRelay<[Game]>(value: [])
    
    init(repository: GameRepository) {
        self.repository = repository
    }
    
    func getMovies(){
        self.repository.getGameList()
            .subscribe(onNext: { (games) in
                self.gameList.accept(games)
            }).disposed(by: self.disposeBag)
    }
}
