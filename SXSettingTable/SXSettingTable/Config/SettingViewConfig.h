//
//  SettingViewConfig.h
//  SXSettingTable
//
//  Created by 沧海小鱼 on 15/7/7.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

/**
 *  屏幕的宽度
 */
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
/**
 *  系统版本相关
 */
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
/**
 *  大于等于7.0的ios版本
 */
#define iOS7_OR_LATER SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")
/**
 *  以RGB值取颜色
 */
#define RGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
/**
 *  以RGBA值取颜色
 */
#define RGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
/**
 *  随机颜色
 */
#define RandomColor RGBColor(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255))

#define kSettingViewCommonRowTableViewContentInset UIEdgeInsetsMake(-20, 0, 0, 0);
#define kSettingViewCommonRowTableViewBackgroundView nil
#define kSettingViewCommonRowTableViewBackgroundColor RGBColor(242, 242, 242)
#define kSettingViewCommonRowTableViewSectionHeaderHeight 20.0f
#define kSettingViewCommonRowTableViewSectionFooterHeight 0

#define kSettingViewCommonRowCellWithIdentifier @"setting"
#define kSettingViewCommonRowCellArrowViewImage @"Settings.bundle/common_setting_icon_arrow"
#define kSettingViewCommonRowCellArrowViewWidth 11
#define kSettingViewCommonRowCellArrowViewHeight 17
#define kSettingViewCommonRowBadgeButtonImage @"Settings.bundle/common_setting_cell_badge"

#define kSettingViewCommonRowCellIconViewBorder 15.0f
#define kSettingViewCommonRowCellIconViewSize CGSizeMake(25.0f, 25.0f)

#define kSettingViewCommonRowCellTitleViewBorder 5.0f
#define kSettingViewCommonRowCellTitleLableHeightScale 0.6f
#define kSettingViewCommonRowCellTitleLableTextColor [UIColor blackColor]
#define kSettingViewCommonRowCellTitleLableFontSize 16
#define kSettingViewCommonRowCellSubTitleLableTextColor [UIColor blackColor]
#define kSettingViewCommonRowCellSubTitleLableFontSize 13

#define kSettingViewCommonRowCellH 48.0f
#define kSettingViewCommonRowCellBackgroundImageGroupFirst @"Settings.bundle/common_setting_cell_background"
#define kSettingViewCommonRowCellBackgroundImageGroupMiddle @"Settings.bundle/common_setting_cell_background"
#define kSettingViewCommonRowCellBackgroundImageGroupLast @"Settings.bundle/common_setting_cell_background_line"
#define kSettingViewCommonRowCellSelectedBackgroundImage @"Settings.bundle/common_setting_cell_background_highlighted"

#define kSettingViewCommonLabelW ScreenWidth - 160
#define kSettingViewCommonLabelH 30.0f
#define kSettingViewCommonLabelTextColor [UIColor lightGrayColor]
#define kSettingViewCommonLabelTextAlignment NSTextAlignmentRight
#define kSettingViewCommonLabelBgColor [UIColor clearColor]
#define kSettingViewCommonLabelFontSize 15

#define kSettingViewCommonTextFiledW ScreenWidth - 160
#define kSettingViewCommonTextFiledH 30.0f
#define kSettingViewCommonTextFiledTextColor [UIColor lightGrayColor]
#define kSettingViewCommonTextFiledTextAlignment NSTextAlignmentRight
#define kSettingViewCommonTextFiledBgColor [UIColor clearColor]
#define kSettingViewCommonTextFiledFontSize 15

#define kSettingViewCommonImageViewW 40.0f
#define kSettingViewCommonImageViewH kSettingViewCommonImageViewW
