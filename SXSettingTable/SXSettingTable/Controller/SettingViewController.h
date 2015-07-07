//
//  SettingViewController.h
//  SXSettingTable
//
//  Created by 沧海小鱼 on 15/7/7.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingViewConfig.h"
#import "SettingGroup.h"
#import "SettingArrowItem.h"
#import "SettingSwitchItem.h"
#import "SettingLabelItem.h"
#import "SettingTextItem.h"
#import "SettingImageItem.h"
#import "SettingCustomItem.h"

@interface SettingViewController : UITableViewController

/**
 *  禁用选中cell样式
 */
@property (nonatomic, assign) BOOL disabledCellSelection;

@property (nonatomic, strong) NSMutableArray *groups;

- (SettingGroup *)addGroup;

@end
