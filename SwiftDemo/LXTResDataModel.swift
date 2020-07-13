//
//  LXTResDataModel.swift
//  SwiftDemo
//
//  Created by ULDD on 2020/7/10.
//  Copyright © 2020 ULDD. All rights reserved.
//

import UIKit
import HandyJSON

class LXTResDataModel: HandyJSON {
    var code : Int = 0
    var data : Any?
    var msg = ""
    
    required init() {
        
    }
}
