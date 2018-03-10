//
//  LBHomeCell.swift
//  LBSwiftExpandFriendList
//
//  Created by yunmei on 2018/1/20.
//  Copyright © 2018年 liubo. All rights reserved.
//

import UIKit
import SnapKit
class LBHomeCell: UITableViewCell {
    var titleLabel:UILabel = UILabel()
    var downLine:UIView = UIView()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension LBHomeCell{
    func setUpLayout(){
        /// 标题
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.center.equalTo(contentView);
        }
        /// 底部的线
        downLine.backgroundColor = UIColor.gray
        contentView.addSubview(downLine)
        downLine.snp.makeConstraints { (make) in
            make.bottom.equalTo(contentView.snp.bottom);
            make.height.equalTo(1);
            make.left.right.equalTo(contentView);
        }
    }
}
