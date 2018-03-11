//
//  LBQQGroupModel.swift
//  LBSwiftExpandFriendList
//
//  Created by yunmei on 2018/1/22.
//  Copyright © 2018年 liubo. All rights reserved.
//

import UIKit

class LBQQGroupModel: NSObject {
    var isOpened:Bool?
    var sectionName:String = ""
    var sectionCount:String = "0"
    var rows:[[String:Any]]?
//    /// 自定义构造函数
//    init(dict : [String : Any]) {
//        super.init()
//
//        setValuesForKeys(dict)
//    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
