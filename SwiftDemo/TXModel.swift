//
//  TXModel.swift
//  SwiftDemo
//
//  Created by ULDD on 2020/4/14.
//  Copyright © 2020 ULDD. All rights reserved.
//

import Foundation

class TXModel: NSObject {
    var userName : String
    var pass : String
    var age = 0
    
    //把读写属性的操作同步到一个线程中 保证多线程同时访问的时候 线程安全
    let dataQueue = DispatchQueue(label: "com.lxt.dataQueue")
    var data : Array<NSString>{
        get{
            return dataQueue.sync {
                self.data
            }
        }
        set{
            dataQueue.sync {
                self.data = newValue
            }
        }
    }
    
    init(userName : String, pass : String) {
        //在构造器中每个属性都必须有值 可以在定义的时候赋值 也可以在构造器方法中赋值
        self.userName = userName
        self.pass = pass  //定时的时候没有初始值需要赋初始值
//        self.age = 10     //age在定义的时候有初始值 可以不用赋值
    }
    
//    func tx_init(name:String, pass:String) -> TXModel {
//        let model = TXModel.init(userName: userName)
//        model.userName = name
//        model.pass = pass
//        return model
//    }
    
//    var nickName : String{
//        get{
//            return self.userName.count > 10 ? "lxt" : self.userName
//        }
//        set{
//            //怎么赋值
////            self.userName = newValue.count > 10 ? "lxt" : newValue
//        }
//    }
    
}

