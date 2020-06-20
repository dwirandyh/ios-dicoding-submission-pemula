//
//  GameDBHelper.swift
//  GameDB
//
//  Created by Dwi Randy Herdinanto on 14/06/20.
//  Copyright © 2020 dwirandyh. All rights reserved.
//

import UIKit

struct ResourceHelper {
    struct Color {
        static let backgroundColor: UIColor = UIColor(named: "BackgroundColor")!
        static let primaryTextColor: UIColor = UIColor(named: "PrimaryTextColor")!
        static let secondaryTextColor: UIColor = UIColor(named: "SecondaryTextColor")!
        static let cardBackgroundColor: UIColor = UIColor(named: "CardBackgroundColor")!
        static let orange: UIColor = UIColor(named: "Orange")!
        static let white: UIColor = UIColor(named: "White")!
        static let green: UIColor = UIColor(named: "Green")!
    }
    
    struct Image {
        static let placeholder: UIImage = UIImage(named: "Placeholder")!
        static let pc: UIImage = UIImage(named: "ic_pc")!
        static let playStation: UIImage = UIImage(named: "ic_playstation")!
        static let xbox: UIImage = UIImage(named: "ic_xbox")!
    }
    
    struct Typography {
        struct Heading {
            static let heading20: UIFont = UIFont.boldSystemFont(ofSize: 20)
            static let heading24: UIFont = UIFont.boldSystemFont(ofSize: 24)
        }
        
        struct Body {
            static let bold10: UIFont = UIFont.boldSystemFont(ofSize: 10)
            static let bold14: UIFont = UIFont.boldSystemFont(ofSize: 14)
            static let bold16: UIFont = UIFont.boldSystemFont(ofSize: 16)
            static let regular10: UIFont = UIFont.systemFont(ofSize: 10)
            static let regular14: UIFont = UIFont.systemFont(ofSize: 14)
            static let regular16: UIFont = UIFont.systemFont(ofSize: 16)
        }
        
        struct Caption {
            static let caption: UIFont = UIFont.systemFont(ofSize: 12)
        }
    }
    
    struct Spacing {
        static let tiny: CGFloat = 4
        static let small: CGFloat = 8
        static let base: CGFloat = 16
        static let medium: CGFloat = 24
        static let large: CGFloat = 32
        static let extraLarge: CGFloat = 48
    }
}

enum GamePlatform: String {
    case pc = "PC"
    case playstation = "PlayStation"
    case xbox = "Xbox"
}
