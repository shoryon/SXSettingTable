//
//  SettingGroup.h
//  SXSettingTable
//
//  Created by 沧海小鱼 on 15/7/7.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingGroup : NSObject

@property (copy, nonatomic) NSString *header;

@property (copy, nonatomic) NSString *footer;

@property (strong, nonatomic) NSArray *items;

+ (instancetype)group;

@end
