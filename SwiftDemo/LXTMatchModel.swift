//
//  LXTMatchModel.swift
//  SwiftDemo
//
//  Created by ULDD on 2020/7/10.
//  Copyright © 2020 ULDD. All rights reserved.
//

import UIKit
import HandyJSON

class LXTMatchModel: HandyJSON {
    var awayId : Int
    var awayLogo : String
    var awayName : String
    var homeName : String = ""
    var homeLogo : String = ""
    
    required init() {
        self.awayId = 0
        self.awayLogo = ""
        self.awayName = ""
        
    }
}
