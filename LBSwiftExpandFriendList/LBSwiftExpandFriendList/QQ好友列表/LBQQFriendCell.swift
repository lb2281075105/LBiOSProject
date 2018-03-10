//
//  LBQQFriendCell.swift
//  LBSwiftExpandFriendList
//
//  Created by yunmei on 2018/1/22.
//  Copyright © 2018年 liubo. All rights reserved.
//

import UIKit

class LBQQFriendCell: UITableViewCell {

    lazy var titleLabel:UILabel = UILabel()
    lazy var onlineLabel:UILabel = UILabel()
    lazy var nikeLabel:UILabel = UILabel()
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
extension LBQQFriendCell{
    func setUpLayout(){
        /// 图标
        imageV.image = UIImage(named: "icon.jpg")
        imageV.layer.cornerRadius = 25
        imageV.layer.masksToBounds = true
        contentView.addSubview(imageV)
        imageV.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView)
            make.left.equalTo(contentView).offset(25)
            make.width.height.equalTo(50)
        }
        /// 标题
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(8)
            make.left.equalTo(imageV.snp.right).offset(10)
        }
        /// 在线状态
        onlineLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(onlineLabel)
        onlineLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(imageV.snp.bottom)
            make.left.equalTo(imageV.snp.right).offset(10)
        }
        /// 昵称
        nikeLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(nikeLabel)
        nikeLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(imageV.snp.bottom);
            make.left.equalTo(onlineLabel.snp.right).offset(10);
        }
    }
}
