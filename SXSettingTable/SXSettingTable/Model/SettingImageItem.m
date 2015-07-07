//
//  SettingImageItem.m
//  SXSettingTable
//
//  Created by 沧海小鱼 on 15/7/7.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import "SettingImageItem.h"
#import "SettingViewConfig.h"

@implementation SettingImageItem

+ (instancetype)itemWithTitle:(NSString *)title {
    
    return [self itemWithTitle:title subTitle:nil];
}

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle {
    
    return [self itemWithTitle:title subTitle:subTitle image:nil];
}

+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image {
    
    return [self itemWithTitle:title subTitle:nil image:image];
}

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle image:(UIImage *)image {
    
    return [self itemWithIcon:nil title:title subTitle:subTitle image:image];
}

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title image:(UIImage *)image {
    
    return [self itemWithIcon:icon title:title subTitle:nil image:image];
}

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title subTitle:(NSString *)subTitle image:(UIImage *)image {
    SettingImageItem *item = [self itemWithIcon:icon title:title subTitle:subTitle];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    
    imageView.frame = CGRectMake(0, 0, kSettingViewCommonImageViewW, kSettingViewCommonImageViewH);
    imageView.image = image;
    imageView.userInteractionEnabled = YES;
    
    item.imageView = imageView;
    
    return item;
}


@end
