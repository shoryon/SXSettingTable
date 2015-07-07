//
//  SettingTextItem.m
//  SXSettingTable
//
//  Created by 沧海小鱼 on 15/7/7.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import "SettingTextItem.h"
#import "SettingViewConfig.h"

@implementation SettingTextItem

+ (instancetype)itemWithTitle:(NSString *)title {
    
    return [self itemWithTitle:title subTitle:nil];
}

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle {
    
    return [self itemWithTitle:title subTitle:subTitle content:nil];
}

+ (instancetype)itemWithTitle:(NSString *)title content:(NSString *)content {
    
    return [self itemWithTitle:title subTitle:nil content:content];
}

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle content:(NSString *)content {
    
    return [self itemWithIcon:nil title:title subTitle:subTitle content:content];
}

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title content:(NSString *)content {
    
    return [self itemWithIcon:icon title:title subTitle:nil content:content];
}

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title subTitle:(NSString *)subTitle content:(NSString *)content {
    SettingTextItem *item = [self itemWithIcon:icon title:title subTitle:subTitle];
    
    UITextField *textField = [[UITextField alloc] init];
    
    textField.frame = CGRectMake(0, 0, kSettingViewCommonTextFiledW, kSettingViewCommonTextFiledH);
    textField.text = content;
    textField.textColor = kSettingViewCommonTextFiledTextColor;
    textField.textAlignment = kSettingViewCommonTextFiledTextAlignment;
    textField.font = [UIFont systemFontOfSize:kSettingViewCommonTextFiledFontSize];
    textField.backgroundColor = kSettingViewCommonTextFiledBgColor;
    
    item.textField = textField;
    
    return item;
}

@end
