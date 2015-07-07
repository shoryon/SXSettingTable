//
//  SettingTextItem.h
//  SXSettingTable
//
//  Created by 沧海小鱼 on 15/7/7.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import "SettingItem.h"

@interface SettingCustomItem : SettingItem

@property (nonatomic, strong) UIView *customView;

+ (instancetype)itemWithTitle:(NSString *)title customView:(UIView *)customView;
+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle customView:(UIView *)customView;
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title customView:(UIView *)customView;
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title subTitle:(NSString *)subTitle customView:(UIView *)customView;

@end
