//
//  GameDBExtension.swift
//  GameDB
//
//  Created by Dwi Randy Herdinanto on 14/06/20.
//  Copyright © 2020 dwirandyh. All rights reserved.
//

import UIKit

extension UIView {
    func addShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 4
    }
}
