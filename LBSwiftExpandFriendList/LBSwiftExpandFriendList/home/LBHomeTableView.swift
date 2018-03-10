//
//  LBHomeTableView.swift
//  LBSwiftExpandFriendList
//
//  Created by yunmei on 2018/1/20.
//  Copyright © 2018年 liubo. All rights reserved.
//

import UIKit

class LBHomeTableView: UITableView {

    lazy var dataSourceArray:[String] = [String]()
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.register(LBHomeCell.self, forCellReuseIdentifier: "LBHomeCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension LBHomeTableView:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LBHomeCell") as! LBHomeCell
        cell.titleLabel.text = "\(dataSourceArray[indexPath.row])"
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            viewController().navigationController?.pushViewController(LBExpandController(), animated: true)
        }else{
            viewController().navigationController?.pushViewController(LBQQFriendListController(), animated: true)
        }
    }

}
