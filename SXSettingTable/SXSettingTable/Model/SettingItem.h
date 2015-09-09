//
//  SettingItem.h
//  SXSettingTable
//
//  Created by 沧海小鱼 on 15/7/7.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SettingItemHandler)();

@interface SettingItem : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, strong) UIColor *subTitleColor;
@property (nonatomic, copy) NSString *badgeValue;
@property (nonatomic, assign) BOOL arrow;
@property (nonatomic, copy) SettingItemHandler operation;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title subTitle:(NSString *)subTitle;
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;
+ (instancetype)itemWithTitle:(NSString *)title;
+ (instancetype)item;

@end
