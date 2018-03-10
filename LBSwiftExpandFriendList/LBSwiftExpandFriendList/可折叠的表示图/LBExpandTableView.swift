//
//  LBExpandTableView.swift
//  LBSwiftExpandFriendList
//
//  Created by yunmei on 2018/1/19.
//  Copyright © 2018年 liubo. All rights reserved.
//

import UIKit
import SnapKit
let LBCellHeight = 44

class LBExpandTableView: UITableView {
    lazy var sectionTitleArray:[String] = [String]()
    lazy var sectionStateArray:[String] = [String]()
    lazy var dataSourceArray:[[String]] = [[String]]()
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.register(LBExpandCell.self, forCellReuseIdentifier: "LBExpandCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension LBExpandTableView:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let index = sectionStateArray[section]
        
        if index == "1" {
            /// 组展开状态
            let array = dataSourceArray[section]
            return array.count
        }
        /// 组闭合状态,返回0
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LBExpandCell")as!LBExpandCell
        cell.titleLabel.text = "\(indexPath.section)组 \(dataSourceArray[indexPath.section][indexPath.row])"
        return cell;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSourceArray.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitleArray[section]
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(LBCellHeight)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(LBCellHeight)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        /// 添加按钮到组头视图
        let button = UIButton.init(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: Int(UIScreen.main.bounds.size.width), height: LBCellHeight)
        button.tag = section + 1
        button.backgroundColor = UIColor.white
        button.setTitleColor(UIColor.gray, for: .normal)
        button.addTarget(self, action: #selector(LBExpandTableView.sectionButtonClick(button:)), for: .touchUpInside)
        button.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 60)
        /// 添加底部线
        let line = UIImageView()
        line.image = UIImage.init(named: "line")
        button.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.equalTo(button);
            make.top.equalTo(button.snp.top).offset(LBCellHeight - 1);
            make.centerY.equalTo(button);
            make.width.equalTo(UIScreen.main.bounds.size.width);
            make.height.equalTo(1);
        }
        /// 添加左边图标
        let leftImgView = UIImageView()
        leftImgView.image = UIImage.init(named: "circle")
        button.addSubview(leftImgView)
        leftImgView.snp.makeConstraints { (make) in
            make.width.height.equalTo(24);
            make.left.equalTo(button).offset(10);
            make.centerY.equalTo(button);
        }
        /// 添加右边的箭头
        let arrowImgView = UIImageView()
        button.addSubview(arrowImgView)
        arrowImgView.snp.makeConstraints { (make) in
            make.width.height.equalTo(10);
            make.centerY.equalTo(button);
            make.left.equalTo(button.snp.left).offset(UIScreen.main.bounds.size.width - 30);
        }
        let state = sectionStateArray[section]
        
        if state == "0" {
            arrowImgView.image = UIImage.init(named: "bottomArrow");
        }else if state == "1" {
            arrowImgView.image = UIImage.init(named: "topArrow")
        }
        /// 每组个数
        let countLabel = UILabel()
        countLabel.backgroundColor = UIColor.clear
        countLabel.font = UIFont.systemFont(ofSize: 14)
        let dataArray = dataSourceArray[section].count
        countLabel.text = "\(dataArray)"
        button.addSubview(countLabel)
        countLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(button);
            make.right.equalTo(arrowImgView.snp.left).offset(-20);
        }
        /// 组标题
        let sectionTitleLabel = UILabel()
        sectionTitleLabel.backgroundColor = UIColor.clear
        sectionTitleLabel.font = UIFont.systemFont(ofSize: 14)
        sectionTitleLabel.text = sectionTitleArray[section];
        button.addSubview(sectionTitleLabel)
        sectionTitleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(button);
            make.left.equalTo(leftImgView.snp.right).offset(15);
        }

        return button;
    }
}
extension LBExpandTableView{
    @objc func sectionButtonClick(button:UIButton){
        
        /// 判断点击组被点击的状态值
        let state = sectionStateArray[button.tag - 1]
        
        if (state == "1"){
            /// 修改点击的状态值
            sectionStateArray[button.tag - 1] = "0"
        }else{
            sectionStateArray[button.tag - 1] = "1"
        }
        /// 刷新组
        let indexSet = NSIndexSet.init(index: button.tag - 1) as IndexSet
        reloadSections(indexSet, with: .automatic)
    }
}
