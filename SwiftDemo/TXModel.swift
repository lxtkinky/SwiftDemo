//
//  TXModel.swift
//  SwiftDemo
//
//  Created by ULDD on 2020/4/14.
//  Copyright © 2020 ULDD. All rights reserved.
//

import Foundation

class TXModel: NSObject {
    var userName = ""
    var pass = ""
    
    
    func tx_init(name:String, pass:String) -> TXModel {
        let model = TXModel.init()
        model.userName = name
        model.pass = pass
        return model
    }
}

