//
//  SettingSwitchItem.m
//  SXSettingTable
//
//  Created by 沧海小鱼 on 15/7/7.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import "SettingSwitchItem.h"

@implementation SettingSwitchItem

+ (instancetype)itemWithTitle:(NSString *)title key:(NSString *)key {
    
    return [self itemWithIcon:nil title:title subTitle:nil key:key];
}

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle key:(NSString *)key {
    
    return [self itemWithIcon:nil title:title subTitle:subTitle key:key];
}

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title key:(NSString *)key {
    
    return [self itemWithIcon:icon title:title subTitle:nil key:key];
}

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title subTitle:(NSString *)subTitle key:(NSString *)key {
    SettingSwitchItem *item = [self item];
    item.icon = icon;
    item.title = title;
    item.subTitle = subTitle;
    item.key = key;
    return item;
}

@end
