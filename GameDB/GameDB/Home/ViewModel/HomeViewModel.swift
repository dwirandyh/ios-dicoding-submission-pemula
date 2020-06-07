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
    let disposeBag: DisposeBag = DisposeBag()
    
    var gameList: BehaviorRelay<[Game]> = BehaviorRelay<[Game]>(value: [])
    
    func getMovies(){
        let repository: GameRepository = GameRepositoryImpl()
        repository.getGameList()
            .observeOn(MainScheduler.instance)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .subscribe(onNext: { (games) in
                self.gameList.accept(games)
            }, onError: { (error) in
                print(error)
            }).disposed(by: self.disposeBag)
    }
}
