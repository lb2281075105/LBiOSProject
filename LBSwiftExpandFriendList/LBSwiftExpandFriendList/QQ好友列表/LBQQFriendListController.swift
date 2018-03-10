//
//  LBQQFriendListController.swift
//  LBSwiftExpandFriendList
//
//  Created by yunmei on 2018/1/20.
//  Copyright © 2018年 liubo. All rights reserved.
//

import UIKit

class LBQQFriendListController: UIViewController {
    /// 测试实例数据
    lazy var dataSourceArray:[[String:Any]] = [[String:Any]]()
    lazy var modelArray:[LBQQGroupModel] = [LBQQGroupModel]()
    lazy var qqFriendTableView:LBQQFriendTableView = {
        let friendTableView = LBQQFriendTableView.init(frame: view.bounds, style: .plain)
        friendTableView.tableFooterView = UIView();
        friendTableView.modelArray = modelArray;
        return friendTableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        title = "QQ好友列表";
        /// 添加表示图数据
        addData()
        /// 添加表示图
        view.addSubview(qqFriendTableView)
    }
}
extension LBQQFriendListController{
    /// 测试实例数据
    func addData(){
        
        dataSourceArray.append(["sectionName":"特别关心","sectionCount":"3","rows":[["name":"Python","nike":"人生苦短，我用Python","status":"1"],["name":"Java","nike":"Java大数据时代到来","status":"1"]]])
        dataSourceArray.append(["sectionName":"家乡","sectionCount":"5","rows":
                [["name":"Swift","nike":"Swift是苹果开发新型开发语言","status":"1"]
                ]])
        dataSourceArray.append(["sectionName":"同学","sectionCount":"3","rows":
                [["name":"PHP","nike":"PHP是世界上最好的语言","status":"1"]
                ]])
        dataSourceArray.append(["sectionName":"家人","sectionCount":"4","rows":
                [["name":"GO","nike":"go是Google发行的语言","status":"1"],["name":"JS","nike":"JS是脚本语言","status":"1"]]])
        dataSourceArray.append(["sectionName":"老师","sectionCount":"3","rows":[["name":"运维","nike":"运维是大型公司不可缺少的一部分","status":"1"]]])
        dataSourceArray.append(["sectionName":"朋友","sectionCount":"3","rows":[["name":"自动化测试","nike":"自动化测试需求大","status":"1"],["name":"运维","nike":"运维是大型公司不可缺少的一部分","status":"1"]]])
        dataSourceArray.append(["sectionName":"小学","sectionCount":"3","rows":[["name":"Python","nike":"人生苦短，我用Python","status":"1"],["name":"自动化测试","nike":"自动化测试需求大","status":"1"]]])
        dataSourceArray.append(["sectionName":"初中","sectionCount":"3","rows":[["name":"自动化测试","nike":"自动化测试需求大","status":"1"]]])
        dataSourceArray.append(["sectionName":"高中","sectionCount":"3","rows":[["name":"自动化测试","nike":"自动化测试需求大","status":"1"],["name":"JS","nike":"JS是脚本语言","status":"1"]]])
        dataSourceArray.append(["sectionName":"大学","sectionCount":"3","rows":[["name":"自动化测试","nike":"自动化测试需求大","status":"1"],["name":"GO","nike":"go是Google发行的语言","status":"1"]]])
        for dic in dataSourceArray {
            let model = LBQQGroupModel()
            model.sectionName = dic["sectionName"] as! String;
            model.sectionCount =  dic["sectionCount"] as! String;
            model.isOpened = false;
            model.rows = dic["rows"] as? [[String : Any]];
            modelArray.append(model)
        }
    }
}
