//
//  SettingSwitchItem.h
//  SXSettingTable
//
//  Created by 沧海小鱼 on 15/7/7.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import "SettingItem.h"

typedef void(^SwitchValueChangedHandler)();

@interface SettingSwitchItem : SettingItem

@property (nonatomic, copy) NSString *key;
@property (nonatomic, copy) SwitchValueChangedHandler switchValueChangedHandler;

+ (instancetype)itemWithTitle:(NSString *)title key:(NSString *)key;
+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle key:(NSString *)key;
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title key:(NSString *)key;
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title subTitle:(NSString *)subTitle key:(NSString *)key;

@end
