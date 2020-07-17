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

    var gameListObservable: BehaviorRelay<[Game]> = BehaviorRelay<[Game]>(value: [])
    var homeUseCase: HomeUseCase
    
    init(homeUseCase: HomeUseCase) {
        self.homeUseCase = homeUseCase
        super.init()
    }
    
    func gatRecommendationGame(){
        self.loadingObservable.accept(true)
        self.homeUseCase.getGameList()
            .subscribe(onNext: { (games) in
                self.gameListObservable.accept(games)
                self.loadingObservable.accept(false)
            }).disposed(by: self.disposeBag)
    }

    func searchGame(query: String){
        self.homeUseCase.searchGame(query: query)
            .subscribe(onNext: { (games) in
                self.gameListObservable.accept(games)
            }).disposed(by: self.disposeBag)
    }
}
