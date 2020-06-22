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

class HomeViewModel: BaseViewModel {
    
    var repository: GameRepository
    var gameListObservable: BehaviorRelay<[Game]> = BehaviorRelay<[Game]>(value: [])
    
    init(repository: GameRepository) {
        self.repository = repository
        super.init()
    }
    
    func gatRecommendationGame(){
        self.loadingObservable.accept(true)
        self.repository.getGameList()
            .subscribe(onNext: { (games) in
                self.gameListObservable.accept(games)
                self.loadingObservable.accept(false)
            }).disposed(by: self.disposeBag)
    }
    
    func searchGame(query: String){
        self.repository.searchGame(query: query)
            .subscribe(onNext: { (games) in
                self.gameListObservable.accept(games)
            }).disposed(by: self.disposeBag)
    }
}
