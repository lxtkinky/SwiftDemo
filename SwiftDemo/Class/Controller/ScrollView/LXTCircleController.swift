//
//  LXTCircleController.swift
//  SwiftDemo
//
//  Created by ULDD on 2020/7/13.
//  Copyright © 2020 ULDD. All rights reserved.
//

import UIKit

class LXTCircleController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        let circleView = LXTCirclePageView.init()
        circleView.imageArray = ["meinv1","meinv2","meinv3","meinv4","meinv5","meinv6","meinv7","meinv8","meinv9","meinv10","meinv11",]
        self.view.addSubview(circleView)
        circleView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize.init(width: screenWidth, height: screenHeight))
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
