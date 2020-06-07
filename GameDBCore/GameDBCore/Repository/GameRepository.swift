//
//  GameRepository.swift
//  GameDBCore
//
//  Created by Dwi Randy Herdinanto on 07/06/20.
//  Copyright © 2020 dwirandyh. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire

public protocol GameRepository {
    func getGameList() -> Observable<[Game]>
}

public class GameRepositoryImpl: GameRepository {
    
    let BASE_URL = "https://api.rawg.io/api"
    
    public init() {
    }
    
    public func getGameList() -> Observable<[Game]> {
        let request = requestData(.get, "\(BASE_URL)/games")
            .mapObject(type: GameListResult.self)
            .flatMap { (gameListResult) -> Observable<[Game]> in
                return Observable.just(gameListResult.results)
        }
        
        return request
    }
    
}
