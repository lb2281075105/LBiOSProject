//
//  LBExpandCell.swift
//  LBSwiftExpandFriendList
//
//  Created by yunmei on 2018/1/19.
//  Copyright © 2018年 liubo. All rights reserved.
//

import UIKit

class LBExpandCell: UITableViewCell {
    lazy var titleLabel:UILabel = UILabel()
    lazy var imageV:UIImageView = UIImageView()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LBExpandCell{
    func setUpLayout(){
        /// 图标
        imageV.image = UIImage.init(named: "rightArrow")
        contentView.addSubview(imageV)
        imageV.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView);
            make.left.equalTo(contentView).offset(33);
            make.width.height.equalTo(10);
        }
        
        /// 标题
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView);
            make.left.equalTo(imageV.snp.right).offset(25);
        }
    }
}
