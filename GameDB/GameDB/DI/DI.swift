//
//  DI.swift
//  GameDB
//
//  Created by Dwi Randy Herdinanto on 07/06/20.
//  Copyright © 2020 dwirandyh. All rights reserved.
//

import Foundation
import Swinject
import GameDBCore

extension Assembler {
    static let sharedAssembler: Assembler = {
        let container = Container()
        let assembler = Assembler([
            CoreDI(),
            HomeAssembly()
        ], container: container)
        
        return assembler
    }()
}
