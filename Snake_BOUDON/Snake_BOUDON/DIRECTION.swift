//
//  DIRECTION.swift
//  Snake_BOUDON
//
//  Created by Pierre on 31/10/2017.
//  Copyright © 2017 boudonpierre. All rights reserved.
//

import Foundation

enum DIRECTION {
    case top
    case bottom
    case right
    case left
    
    static func getEnum(s: String) -> DIRECTION {
        if s == "Top" {
            return .top
        } else if s == "Bottom" {
            return .bottom
        } else if s == "Right" {
            return .right
        } else if s == "Left" {
            return .left
        }
        
        return .top
    }
}
