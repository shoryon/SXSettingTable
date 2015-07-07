//
//  SettingLabelItem.m
//  SXSettingTable
//
//  Created by 沧海小鱼 on 15/7/7.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import "SettingLabelItem.h"
#import "SettingViewConfig.h"

@implementation SettingLabelItem

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
    SettingLabelItem *item = [self itemWithIcon:icon title:title subTitle:subTitle];
    
    UILabel *lableView = [[UILabel alloc] init];
    
    lableView.frame = CGRectMake(0, 0, kSettingViewCommonLabelW, kSettingViewCommonLabelH);
    lableView.text = content;
    lableView.textColor = kSettingViewCommonLabelTextColor;
    lableView.textAlignment = kSettingViewCommonLabelTextAlignment;
    lableView.font = [UIFont systemFontOfSize:kSettingViewCommonLabelFontSize];
    lableView.backgroundColor = kSettingViewCommonLabelBgColor;
    
    item.lableView = lableView;
    
    return item;
}

@end
