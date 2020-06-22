//
//  BaseViewModel.swift
//  GameDBCore
//
//  Created by Dwi Randy Herdinanto on 20/06/20.
//  Copyright © 2020 dwirandyh. All rights reserved.
//

import UIKit
import RxRelay
import RxSwift

open class BaseViewModel {
    
    public var loadingObservable: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    
    public let disposeBag: DisposeBag = DisposeBag()
    
    public init(){
    }
}
