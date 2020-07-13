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
        let model : TXModel =  self.dataArray.object(at: indexPath.row) as? TXModel ?? TXModel.init(userName: "", pass: "")
        cell.textLabel?.text = model.userName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let studyVC = StudyController.init()
//        studyVC.modalPresentationStyle = .fullScreen
//        self.present(studyVC, animated: true) {}
        
        let circleVC = LXTCircleController.init()
        self.present(circleVC, animated: true) {}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
        
        for i in 0...10 {
//            self.dataArray.add(String(i + 1))
            let model =  TXModel.init(userName: String("lxt\(i)"), pass: "123456")
            self.dataArray.add(model)
        }
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = .white
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
//        self.tableView.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
//            make.bottom.equalTo(-10)
            make.bottom.equalToSuperview().offset(-10)
        }
        
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
//            $0.center.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.tableView.snp.bottom).offset(-50)
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
         let params = Params.init(apiName: "getBkMatchDetail", matchId: "47082", type: "0")
        LXTRequestManager().lxt_getRequest(params: params) { (resModel) in
            print("接口状态：\(resModel.code),错误信息：\(resModel.msg)")
            let data = resModel.data as! NSDictionary
            let matchData = data["matchDetail"] as! Dictionary<String, Any>
            let matchModel = LXTMatchModel.deserialize(from: matchData) ?? LXTMatchModel()
            let matchModel2 = LXTMatchModel.deserialize(from: matchData)
//            print("主队：\(String(describing: matchModel2?.homeName)),logo:\(String(describing: matchModel2?.homeLogo))")
            if let model = matchModel2{
                print("主队：\(model.homeName),logo:\(model.homeLogo)")
            }
            
//            print(data["matchDetail"] ?? [])
            print("客队：\(matchModel.awayName), logo：\(matchModel.awayLogo)")
        }
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
        
        _ = try? JSON.init(data: jsonData)
//        print(json?[0] ?? <#default value#>)
        
    }
    
    deinit {
        //释放之前做一些清理工作
    }

}

