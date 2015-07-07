//
//  SettingImageItem.h
//  SXSettingTable
//
//  Created by 沧海小鱼 on 15/7/7.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import "SettingItem.h"

@interface SettingImageItem : SettingItem

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *custmImageView;

+ (instancetype)itemWithTitle:(NSString *)title;
+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle;
+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image;
+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle image:(UIImage *)image;
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title image:(UIImage *)image;
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title subTitle:(NSString *)subTitle image:(UIImage *)image;
@end
