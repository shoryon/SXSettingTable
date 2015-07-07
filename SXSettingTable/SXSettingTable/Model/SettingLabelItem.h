//
//  SettingLabelItem.h
//  SXSettingTable
//
//  Created by 沧海小鱼 on 15/7/7.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import "SettingItem.h"

@interface SettingLabelItem : SettingItem

@property (nonatomic, strong) UILabel *lableView;

+ (instancetype)itemWithTitle:(NSString *)title;
+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle;
+ (instancetype)itemWithTitle:(NSString *)title content:(NSString *)content;
+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle content:(NSString *)content;
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title content:(NSString *)content;
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title subTitle:(NSString *)subTitle content:(NSString *)content;

@end
