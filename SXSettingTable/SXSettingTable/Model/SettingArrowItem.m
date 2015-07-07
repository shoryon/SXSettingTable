//
//  SettingArrowItem.m
//  SXSettingTable
//
//  Created by 沧海小鱼 on 15/7/7.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import "SettingArrowItem.h"

@implementation SettingArrowItem

+ (instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass {
    
    return [self itemWithTitle:title subTitle:nil destVcClass:destVcClass];
}

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle destVcClass:(Class)destVcClass {
    
    return [self itemWithIcon:nil title:title subTitle:subTitle destVcClass:destVcClass];
}

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass {
    
    return [self itemWithIcon:icon title:title subTitle:nil destVcClass:destVcClass];
}

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title subTitle:(NSString *)subTitle destVcClass:(Class)destVcClass {
    SettingArrowItem *item = [self itemWithIcon:icon title:title subTitle:subTitle];
    item.destVcClass = destVcClass;
    return item;
}

@end
