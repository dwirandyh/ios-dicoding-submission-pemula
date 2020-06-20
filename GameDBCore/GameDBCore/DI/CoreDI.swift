//
//  File.swift
//  GameDBCore
//
//  Created by Dwi Randy Herdinanto on 07/06/20.
//  Copyright © 2020 dwirandyh. All rights reserved.
//

import Foundation
import Swinject

public class CoreDI: Assembly {
    
    public init(){}
    
    public func assemble(container: Container) {
        container.register(GameRepository.self) { (resolver) in
            GameRepositoryImpl()
        }
        
        container.register(BaseViewModel.self) { (resolver) in
            BaseViewModel()
        }
        
        container.register(BaseViewController.self) { (resolver) in
            BaseViewController(viewModel: resolver.resolve(BaseViewModel.self)!)
        }
    }
}
