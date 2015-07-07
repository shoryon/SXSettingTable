//
//  SettingTextItem.m
//  SXSettingTable
//
//  Created by 沧海小鱼 on 15/7/7.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import "SettingCustomItem.h"

@implementation SettingCustomItem

+ (instancetype)itemWithTitle:(NSString *)title customView:(UIView *)customView {
    
    return [self itemWithTitle:title subTitle:nil customView:customView];
}

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle customView:(UIView *)customView {
    
    return [self itemWithIcon:nil title:title subTitle:subTitle customView:customView];
}

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title customView:(UIView *)customView {
    
    return [self itemWithIcon:icon title:title subTitle:nil customView:customView];
}

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title subTitle:(NSString *)subTitle customView:(UIView *)customView {
    SettingCustomItem *item = [self itemWithIcon:icon title:title subTitle:subTitle];
    item.customView = customView;
    return item;
}

@end
