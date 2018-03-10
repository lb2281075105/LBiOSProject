//
//  LBExpandController.swift
//  LBSwiftExpandFriendList
//
//  Created by yunmei on 2018/1/19.
//  Copyright © 2018年 liubo. All rights reserved.
//

import UIKit

class LBExpandController: UIViewController {
    /// 所有组的数据
    lazy var dataSourceArray:[[String]] = [[String]]()
    /// 组标题
    lazy var sectionTitleArray = { () -> [String] in
        let titleArray = ["一级分类","一级分类","一级分类","一级分类","一级分类","一级分类","一级分类","一级分类","一级分类","一级分类","一级分类"]
        return titleArray
    }()
    /// 每组展开状态
    lazy var sectionStateArray:[String] = [String]()
    /// 表示图
    lazy var lbexpandTableView:LBExpandTableView = {
        let expandTableView = LBExpandTableView.init(frame: UIScreen.main.bounds, style: .plain)
        return expandTableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "可以折叠的表示图"
        view.backgroundColor = UIColor.white
        /// 添加表示图数据
        addData()
        view.addSubview(lbexpandTableView)
    }

}
extension LBExpandController{
    func addData(){
        /// 下面是数据测试实例
        let zero = ["二级分类"];
        let one = ["二级分类","二级分类"];
        let two = ["二级分类","二级分类","二级分类"];
        let three = ["二级分类","二级分类","二级分类","二级分类"];
        let four = ["二级分类","二级分类","二级分类","二级分类","二级分类"];
        let five = ["二级分类","二级分类","二级分类","二级分类","二级分类","二级分类"];
        let six = ["二级分类","二级分类","二级分类","二级分类","二级分类","二级分类","二级分类"];
        let seven = ["二级分类","二级分类","二级分类","二级分类","二级分类","二级分类","二级分类","二级分类"];
        let eight = ["二级分类","二级分类","二级分类","二级分类","二级分类","二级分类","二级分类","二级分类","二级分类"];
        let nine = ["二级分类","二级分类","二级分类","二级分类","二级分类","二级分类","二级分类","二级分类","二级分类","二级分类"];
        dataSourceArray.append(zero)
        dataSourceArray.append(one)
        dataSourceArray.append(two)
        dataSourceArray.append(three)
        dataSourceArray.append(four)
        dataSourceArray.append(five)
        dataSourceArray.append(six)
        dataSourceArray.append(seven)
        dataSourceArray.append(eight)
        dataSourceArray.append(nine)
        
        for _ in dataSourceArray {
            /// 默认所有的组都是闭合的
            sectionStateArray.append("0")
        }
        lbexpandTableView.dataSourceArray = dataSourceArray
        lbexpandTableView.sectionStateArray = sectionStateArray
        lbexpandTableView.sectionTitleArray = sectionTitleArray
    }
}
