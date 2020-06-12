//
//  StudyController.swift
//  SwiftDemo
//
//  Created by ULDD on 2020/5/9.
//  Copyright © 2020 ULDD. All rights reserved.
//

import UIKit

class StudyController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func 基础语法_可选类型() -> Void {
        // 普通可选：类型？
        let aString: String? = "普通可选类型"
        // 普通可选获取值，必须强制解析
        let aStr = aString!
        type(of: aStr)  // -> String


        // 隐式解析可选类型: 类型!
        let bString: String! = "隐式解析可选类型"
        // 隐式解析可选类型，在定义时就制定了非空值，所以可以直接取值。
        let bStr = bString
        type(of: bStr) // -> String
        
        let someOptional: String? = "hell world"

        if let constantName = someOptional {
            // String
            print(type(of: constantName))
            print(constantName)
        } else {
            // 绑定失败
        }
        
        //在swift中语言中，可选调用链，整个链条上的值都可能是可选类型，如果值是nil，则终止后面的调用直接返回nil。
//        if (person != null){
//            if (person.name != null){
//              print(person.name.length())
//            }
//        }
        //swift
//        print(person?.mac?.name.count ?? 0)
    }

}
