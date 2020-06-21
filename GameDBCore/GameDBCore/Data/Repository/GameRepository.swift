//
//  GameRepository.swift
//  GameDBCore
//
//  Created by Dwi Randy Herdinanto on 07/06/20.
//  Copyright © 2020 dwirandyh. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxAlamofire

public enum NetworkError: Error {
    case notFound
    case error
}

public protocol GameRepository {
    func getGameList() -> Observable<[Game]>
    func searchGame(query: String) -> Observable<[Game]>
}

public class GameRepositoryImpl: GameRepository {
    
    let BASE_URL = "https://api.rawg.io/api"
    
    public init() {
    }
    
    public func getGameList() -> Observable<[Game]> {
        let request = requestData(.get, "\(BASE_URL)/games")
            .mapObject(type: GameListResult.self)
            .flatMap { (gameListResult) -> Observable<[Game]> in
                if gameListResult.results != nil {
                    return Observable.just(gameListResult.results!)
                }
                throw NetworkError.notFound
                
        }
        .observeOn(MainScheduler.instance)
        .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
        
        return request
    }
    
    public func searchGame(query: String) -> Observable<[Game]> {
        let parameters: Parameters = [
            "search": query
        ]
        let request = requestData(.get, "\(BASE_URL)/games", parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .mapObject(type: GameListResult.self)
            .flatMap({ (gameListResult) -> Observable<[Game]> in
                if gameListResult.results != nil {
                    return Observable.just(gameListResult.results!)
                }
                throw NetworkError.notFound
            })
            .observeOn(MainScheduler.instance)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
        
        return request
    }
    
}
