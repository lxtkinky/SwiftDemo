//
//  Constant.swift
//  SwiftDemo
//
//  Created by ULDD on 2020/7/13.
//  Copyright © 2020 ULDD. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

func rgb(_ red : UInt32, _ green : UInt32, _ blue : UInt32) -> UIColor {
    return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1)
}

func kRandomColor() -> UIColor {
    return rgb(arc4random() % 255, arc4random() % 255, arc4random() % 255)
}
//let KRandomColor = rgb(arc4random() % 255, arc4random() % 255, arc4random() % 255)
