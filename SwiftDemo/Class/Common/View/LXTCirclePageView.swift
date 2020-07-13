//
//  LXTCirclePageView.swift
//  SwiftDemo
//
//  Created by ULDD on 2020/7/13.
//  Copyright © 2020 ULDD. All rights reserved.
//

import UIKit

class LXTCirclePageView: UIView {
    var scrollView = UIScrollView()
    var imageArray : Array<NSString> = []{
        didSet{
            self.lxt_initSubView()
        }
    }
    
    
    
    func lxt_initSubView() -> Void {
        if imageArray.count == 0 {
            return
        }
        self.scrollView = UIScrollView.init(frame: self.bounds)
        self.backgroundColor = kRandomColor()
        self.addSubview(self.scrollView)
        self.scrollView.isPagingEnabled = true
//        self.scrollView.backgroundColor = .blue
        self.scrollView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        var imageViewArray : Array = Array<UIImageView>.init()
        for index in 0..<imageArray.count{
            let imageStr : String = imageArray[index] as String
            let imageView = self.lxt_createImageView(imageStr: imageStr)
            imageView.contentMode = .scaleAspectFit
            imageViewArray.append(imageView)
            self.scrollView.addSubview(imageView)
            imageView.snp.makeConstraints { (make) in
                if index == 0{
                    make.left.equalToSuperview()
                }else{
                    let preImageView = imageViewArray[index - 1]
                    make.left.equalTo(preImageView.snp.right)
                }
                
                if index == imageArray.count - 1{
                    make.right.equalToSuperview()
                }
                
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                make.size.equalToSuperview()
            }
        }
    }
    
    func lxt_createImageView(imageStr : String) -> UIImageView {
        if imageStr.hasPrefix("http") {
            let imageData = try? Data(contentsOf: URL.init(fileURLWithPath: imageStr))
            return UIImageView.init(image: UIImage.init(data: imageData ?? Data.init()))
        }else{
            return UIImageView(image: UIImage(named: imageStr))
        }
    }

}
