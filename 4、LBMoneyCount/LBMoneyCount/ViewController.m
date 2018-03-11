//
//  ViewController.m
//  LBMoneyCount
//
//  Created by yunmei on 2017/9/27.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
@interface ViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UITextField *textField1;
@property (nonatomic, strong) UITextField *textField2;
@property (nonatomic, strong) UITextField *textField3;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, strong) UILabel *label3;
@end

@implementation ViewController
/// UITextfield 金额格式限制，UITextfield正整数格式限制
- (void)viewDidLoad {
    [super viewDidLoad];
    
    /// 第一种金额格式限制
    [self firstMoneyMethod];
    /// 第二种金额格式限制
    [self secondMoneyMethod];
    /// 数量正整数输出
    [self countMethod];
    /// 金额转大写
    [self upperMoney];
}
/// 第一种金额格式限制
- (void)firstMoneyMethod{

    _label = [[UILabel alloc]init];
    [self.view addSubview:_label];
    _label.text = @"第一种";
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@40);
        make.top.equalTo(@100);
        make.height.equalTo(@40);
    }];

    _textField = [[UITextField alloc]init];
    _textField.keyboardType = UIKeyboardTypeDecimalPad;
    [self.view addSubview:_textField];
    _textField.layer.borderColor = [UIColor grayColor].CGColor;
    _textField.layer.borderWidth = 1;
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_label.mas_right).offset(10);
        make.width.equalTo(@200);
        make.centerY.equalTo(_label);
        make.height.equalTo(@40);
    }];
    [_textField setPlaceholder:@" 请输入金额"];
    [_textField setDelegate:self];
}

/// 第二种金额格式限制
- (void)secondMoneyMethod{

    _label1 = [[UILabel alloc]init];
    [self.view addSubview:_label1];
    _label1.text = @"第二种";
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@40);
        make.top.equalTo(_label).offset(60);
        make.height.equalTo(@40);
    }];
    
    _textField1 = [[UITextField alloc]init];
    _textField1.keyboardType = UIKeyboardTypeDecimalPad;
    [self.view addSubview:_textField1];
    _textField1.layer.borderColor = [UIColor grayColor].CGColor;
    _textField1.layer.borderWidth = 1;
    [_textField1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_label.mas_right).offset(10);
        make.width.equalTo(@200);
        make.centerY.equalTo(_label1);
        make.height.equalTo(@40);
    }];
    [_textField1 setPlaceholder:@" 请输入金额"];
    [_textField1 setDelegate:self];
    
}
/// 正整数输出
- (void)countMethod{

    _label2 = [[UILabel alloc]init];
    [self.view addSubview:_label2];
    _label2.text = @"第三种";
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@40);
        make.top.equalTo(_label1).offset(60);
        make.height.equalTo(@40);
    }];
    
    _textField2 = [[UITextField alloc]init];
    _textField2.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:_textField2];
    _textField2.layer.borderColor = [UIColor grayColor].CGColor;
    _textField2.layer.borderWidth = 1;
    [_textField2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_label.mas_right).offset(10);
        make.width.equalTo(@200);
        make.centerY.equalTo(_label2);
        make.height.equalTo(@40);
    }];
    [_textField2 setPlaceholder:@" 请输入数量"];
    [_textField2 setDelegate:self];
    
}
- (void)upperMoney{
    _label3 = [[UILabel alloc]init];
    [self.view addSubview:_label3];
    _label3.text = @"第四种";
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@40);
        make.top.equalTo(_label2).offset(60);
        make.height.equalTo(@40);
    }];
    
    _textField3 = [[UITextField alloc]init];
    _textField3.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:_textField3];
    _textField3.layer.borderColor = [UIColor grayColor].CGColor;
    _textField3.layer.borderWidth = 1;
    [_textField3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_label2.mas_right).offset(10);
        make.width.equalTo(@200);
        make.centerY.equalTo(_label3);
        make.height.equalTo(@40);
    }];
    [_textField3 setPlaceholder:@" 请输入金额"];
    _textField3.delegate = self;
}
- (NSString *)getUpperMoney:(NSString *)money{
    
    if (money.length == 0) {
        return @"";
    }
    if (money.floatValue == 0) {
        return @"零圆整";
    }
    /// 大写数字
    NSArray *upperArray = @[ @"零",@"壹",@"贰",@"叁",@"肆",@"伍",@"陆",@"柒",@"捌",@"玖" ];
    /// 整数部分的单位
    NSArray *measureArray = @[ @"", @"拾", @"佰", @"仟"];
    /// 整数部分的单位
    NSArray *intUnit = @[@"圆", @"万", @"亿"];
    /// 小数部分的单位
    NSArray *floatUnitArray = @[ @"角", @"分" ];
    
    NSString *upIntNum = [NSString string];
    NSString *upFloatNum = [NSString string];
    NSArray *numArray = [money componentsSeparatedByString:@"."];
    
    NSString *str1 = [numArray objectAtIndex:0];
    NSInteger num1 = str1.integerValue;
    /// 这一部分就是单纯的转化
    for (int i = 0; i < intUnit.count && num1 > 0; i++) {
        NSString *temp = @"";
        int tempNum = num1%10000;
        if (tempNum != 0 || i == 0) {
            for (int j = 0; j < measureArray.count && num1 > 0; j++) {
                /// 每次转化最后一位数
                temp = [NSString stringWithFormat:@"%@%@%@", [upperArray objectAtIndex:num1%10], [measureArray objectAtIndex:j],temp];
                /// 数字除以10
                num1 = num1/10;
            }
            upIntNum = [[temp stringByAppendingString:[intUnit objectAtIndex:i]] stringByAppendingString:upIntNum];
        } else {
            num1 /= 10000;
            temp = @"零";
            upIntNum = [temp stringByAppendingString:upIntNum];
        }
        
    }
    /// 把零佰零仟这种情况转为零
    for (int m = 1; m < measureArray.count; m++) {
        NSString *lingUnit = [@"零" stringByAppendingString:[measureArray objectAtIndex:m]];
        upIntNum = [upIntNum stringByReplacingOccurrencesOfString:lingUnit withString:@"零"];
    }
    /// 多个零相邻的保留一个零
    while ([upIntNum rangeOfString:@"零零"].location != NSNotFound) {
        upIntNum = [upIntNum stringByReplacingOccurrencesOfString:@"零零" withString:@"零"];
    }
    /// 零万、零亿这种情况转化为万零
    for (int k = 0; k < intUnit.count * 2; k++) {
        NSString *unit = [intUnit objectAtIndex:k%intUnit.count];
        NSString *lingUnit = [@"零" stringByAppendingString:unit];
        upIntNum = [upIntNum stringByReplacingOccurrencesOfString:lingUnit withString:[unit stringByAppendingString:@"零"]];
    }
    /// 小数部分转化
    if (numArray.count == 2) {
        NSString *floatStr = [numArray objectAtIndex:1];
        for (NSInteger i = floatStr.length; i > 0; i--) {
            NSString *temp = [floatStr substringWithRange:NSMakeRange(floatStr.length - i, 1)];
            NSInteger tempNum = temp.integerValue;
            if (tempNum == 0) continue;
            NSString *upNum = [upperArray objectAtIndex:tempNum];
            NSString *unit = [floatUnitArray objectAtIndex:floatStr.length - i];
            if (i < floatStr.length && upFloatNum.length == 0 && upIntNum.length > 0) {
                upFloatNum = @"零";
            }
            upFloatNum = [NSString stringWithFormat:@"%@%@%@", upFloatNum, upNum, unit];
        }
    }
    if (upFloatNum.length == 0) {
        upFloatNum = @"整";
    }
    
    NSString *amountInWords = [NSString stringWithFormat:@"%@%@", upIntNum, upFloatNum];
    /// 再次除去多余的零
    while ([amountInWords rangeOfString:@"零零"].location != NSNotFound) {
        amountInWords = [amountInWords stringByReplacingOccurrencesOfString:@"零零" withString:@"零"];
    }
    
    if ([amountInWords rangeOfString:@"零整"].location != NSNotFound) {
        amountInWords = [amountInWords stringByReplacingOccurrencesOfString:@"零整" withString:@"整"];
    }
    
    return amountInWords;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{   /// 小数点前面限制输出位数
    if (_textField == textField) {
        /// 删除键
        if ([string isEqualToString:@""]) {
            return YES;
        }
        
        if (string.length != 1) {
            return NO;
        }
        
        if (![@"0123456789." rangeOfString:string].length) {
            return NO;
        }
        
        if (textField.text.length == 0) {
            return ![string isEqualToString:@"."];
        } else if (textField.text.length == 1){
            /// 第一位为0，只能输入.
            if ([textField.text isEqualToString:@"0"]) {
                return [string isEqualToString:@"."];
            }
        } else {
            if ([textField.text rangeOfString:@"."].length) {
                /// 只能输入一个.
                if ([string isEqualToString:@"."]) {
                    return NO;
                }
                /// 小数点后2位
                NSArray *ary =  [textField.text componentsSeparatedByString:@"."];
                if (ary.count == 2) {
                    if ([ary[1] length] == 2) {
                        return NO;
                    }
                }
            } else {
                /// 小数点前6位
                if ([textField.text length] == 6) {
                    if (![string isEqualToString:@"."]) {
                        return NO;
                    }
                }
            }
        }
    }else if(_textField1 == textField){
        /// 小数点前面不限制输出位数
        /// 删除处理
        if ([string isEqualToString:@""]) {
            return YES;
        }
        /// 首位不能为.号
        if (range.location == 0 && [string isEqualToString:@"."]) {
            return NO;
        }
    
        /// 判断只输出数字和.号
        if (![@"0123456789." rangeOfString:string].length) {
            return NO;
        }
    
        /// 逻辑处理
        if ([textField.text containsString:@"."]) {
            if ([string isEqualToString:@"."]) {
                return NO;
            }
            NSRange subRange = [textField.text rangeOfString:@"."];
            if (range.location - subRange.location > 2) {
                return NO;
            }
            
        }
    }else{
        /// 输出正整数
        if ([string isEqualToString:@""]) {
            return YES;
        }

        if (string.length != 1) {
            return NO;
        }

        if (![@"0123456789" rangeOfString:string].length) {
            return NO;
        }
        /// 输入第一个为0,则不再输出
        if (textField.text.length == 1) {
            if ([textField.text isEqualToString:@"0"]) {
                return NO;
            }
        }
        /// 限制输出正整数位数
        if (textField.text.length == 6) {
            return NO;
        }

    }
    /// 金额转大写
    if (_textField3 == textField) {
        NSLog(@"大写：%@",[self getUpperMoney:_textField3.text]);
    }
    return YES;
}





@end
