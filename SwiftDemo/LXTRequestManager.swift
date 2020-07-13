//
//  LXTRequestManager.swift
//  SwiftDemo
//
//  Created by ULDD on 2020/7/10.
//  Copyright © 2020 ULDD. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

struct Params: Encodable {
    let apiName: String
    let matchId: String
    let type    : String
}

class LXTRequestManager: NSObject {
    func lxt_getRequest(params : Params, success : @escaping (LXTResDataModel) -> Void) -> Void {
        AF.request("http://47.113.104.253:8081/league/data", method: .post, parameters: params, encoder: JSONParameterEncoder.default, headers: nil, interceptor: nil).responseJSON { (response) in
//            print("加载数据完成")
            
            switch response.result{
            case .success(let data):
                print(data)
                let dict : Dictionary = data as! Dictionary<String, Any>
                let resModel = LXTResDataModel.deserialize(from: dict)
                success(resModel ?? LXTResDataModel())
            case .failure(let error):
                print(error)
            }
            
            if let data = response.data{
                let jsonString = String(data: data , encoding: String.Encoding.utf8)
                let resModel = LXTResDataModel.deserialize(from: jsonString)
//                let dataJson = try? JSON(data: data)
//                let resModel = LXTResDataModel()
//                resModel.code = dataJson?["code"].int ?? -1
//                resModel.data = dataJson?["data"].dictionary
//                resModel.msg = dataJson?["msg"].string ?? ""
                success(resModel ?? LXTResDataModel())
            }
        }
    }
    
    func lxt_postRequest(params : Params, success : @escaping (LXTResDataModel) -> Void) -> Void {
        AF.request("http://47.113.104.253:8081/league/data", method: .post, parameters: params, encoder: JSONParameterEncoder.default, headers: nil, interceptor: nil)
    }
}
