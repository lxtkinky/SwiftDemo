//
//  ViewController.swift
//  SwiftDemo
//
//  Created by ULDD on 2020/4/14.
//  Copyright © 2020 ULDD. All rights reserved.
//

import UIKit
import SnapKit

import SwiftyJSON
import Alamofire

import HMSegmentedControl

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let tableView = UITableView()
    var dataArray = NSMutableArray.init()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        let model : TXModel =  self.dataArray.object(at: indexPath.row) as? TXModel ?? TXModel()
        cell.textLabel?.text = model.userName
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...10 {
//            self.dataArray.add(String(i + 1))
            let model =  TXModel().tx_init(name: String("lxt \(i)"), pass: "123456")
            self.dataArray.add(model)
        }
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.tableView.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.addSubview(self.tableView)
        
        self.lxt_initSubView()
    }

    func lxt_initSubView() {
        let button = UIButton.init()
        button.setTitle("click", for: UIControl.State.normal )
//        button.backgroundColor = UIColor.yellow
        button.backgroundColor = UIColor.init(red: 123/255.0, green: 222/255.0, blue: 12/255.0, alpha: 1)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        
        button.addTarget(self, action:#selector(ViewController.lxt_buttonClick) , for: UIControl.Event.touchUpInside)
        self.view.addSubview(button)
        button.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(40)
        }
    }
    
    @objc func lxt_buttonClick(){
        NSLog("hello %@", "lxt")
//        lxt_jsonParse()
        lxt_loadData()
    }
    
    func lxt_loadData() -> Void {
        
        struct Params: Encodable {
            let apiName: String
            let matchId: String
            let type    : String
        }
        
//        let dict : [String : Any] = [
//                    "apiName"   :   "getMatchInfoById",
//                    "matchId"   :   1000,
//                    "type"      :   0
//            ]
        
        let params = Params.init(apiName: "getBkMatchDetail", matchId: "47082", type: "0")
        AF.request("http://47.113.104.253:8081/league/data", method: .post, parameters: params, encoder: JSONParameterEncoder.default, headers: nil, interceptor: nil).responseJSON { (response) in
            print("加载数据完成")
            print(response.result)
           
        }
//        AF.request("http://47.113.104.253:8081/league/data")
//            .response { (data) in
//                print(data)
//        }
//        AF.request("", method: HTTPMethod.post, parameters: Login, encoder: JSONParameterEncoder.default)
    }
    
    func lxt_jsonParse() -> Void {
        let jsonStr = "[{\"name\": \"hangge\", \"age\": 100, \"phones\": [{\"name\": \"公司\",\"number\": \"123456\"}, {\"name\": \"家庭\",\"number\": \"001\"}]}, {\"name\": \"big boss\",\"age\": 1,\"phones\": [{ \"name\": \"公司\",\"number\": \"111111\"}]}]"
        let jsonData : Data = jsonStr.data(using: String.Encoding.utf8, allowLossyConversion: false)!
//        do {
//            let json = try? JSON.init(data: jsonData)
//            print(json[0])
//        } catch <#pattern#> {
//
//        }
        
        let json = try? JSON.init(data: jsonData)
        print(json?[0])
        
    }

}

