//
//  LBHomeController.swift
//  LBSwiftExpandFriendList
//
//  Created by yunmei on 2018/1/20.
//  Copyright © 2018年 liubo. All rights reserved.
//

import UIKit

class LBHomeController: UIViewController {
    /// 数据
    lazy var dataSourceArray:[String] = ["可折叠的表示图","QQ好友列表"]
    /// 表示图
    lazy var lbhomeTableView:LBHomeTableView = {
        let homeTableView = LBHomeTableView.init(frame: UIScreen.main.bounds, style: .plain)
        homeTableView.tableFooterView = UIView();
        homeTableView.dataSourceArray = dataSourceArray;
        homeTableView.rowHeight = 50;
        return homeTableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "TableView折叠"
        view.backgroundColor = UIColor.white
        view.addSubview(lbhomeTableView)
    }
}
