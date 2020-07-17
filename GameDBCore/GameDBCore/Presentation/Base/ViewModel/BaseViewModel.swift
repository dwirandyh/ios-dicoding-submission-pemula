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

public protocol ViewModel {
    var loadingObservable: BehaviorRelay<Bool> { get }
}

open class BaseViewModel: ViewModel {
    
    public var loadingObservable: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    
    public let disposeBag: DisposeBag = DisposeBag()
    
    public init(){
        // MARK: To make it can be accessed from outside module
    }
}
