//
//  SettingCell.m
//  SXSettingTable
//
//  Created by 沧海小鱼 on 15/7/7.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import "SettingCell.h"
#import "SettingItem.h"
#import "SettingViewConfig.h"
#import "SettingArrowItem.h"
#import "SettingSwitchItem.h"
#import "SettingLabelItem.h"
#import "SettingTextItem.h"
#import "SettingImageItem.h"
#import "SettingCustomItem.h"
#import "BadgeButton.h"
#import "UIImage+Extension.h"

@interface SettingCell()

/**
 *  箭头
 */
@property (strong, nonatomic) UIImageView *arrowView;
/**
 *  开关
 */
@property (strong, nonatomic) UISwitch *switchView;
/**
 *  提醒数字
 */
@property (strong, nonatomic) BadgeButton *badgeButton;

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, weak) UIImageView *bgView;

@property (nonatomic, weak) UIImageView *selectedBgView;

@end

@implementation SettingCell

- (UISwitch *)switchView {
    if (_switchView == nil) {
        _switchView = [[UISwitch alloc] init];
        SettingSwitchItem *item = (SettingSwitchItem *)self.item;
        if (item.key) {
            _switchView.on = [[[NSUserDefaults standardUserDefaults] objectForKey:item.key] boolValue];
            [_switchView addTarget:self action:@selector(switchHander:) forControlEvents:UIControlEventValueChanged];
        }
    }
    return _switchView;
}

- (void)switchHander:(UISwitch *)switchView {
    
    SettingSwitchItem *item = (SettingSwitchItem *)self.item;
    
    [[NSUserDefaults standardUserDefaults] setObject:@([switchView isOn]) forKey:item.key];
}

- (UIImageView *)arrowView {
    if (_arrowView == nil) {
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:kSettingViewCommonRowCellArrowViewImage]];
        _arrowView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _arrowView;
}

- (BadgeButton *)badgeButton {
    if (_badgeButton == nil) {
        _badgeButton = [[BadgeButton alloc] init];
    }
    return _badgeButton;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = kSettingViewCommonRowCellWithIdentifier;
    SettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[SettingCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.tableView = tableView;
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        // 标题
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.textLabel.textColor = [UIColor blackColor];
        self.textLabel.highlightedTextColor = self.textLabel.textColor;
        self.textLabel.font = [UIFont systemFontOfSize:kSettingViewCommonRowCellTitleLableFontSize];
        // 创建背景
        UIImageView *bgView = [[UIImageView alloc] init];
        self.backgroundView = bgView;
        self.bgView = bgView;
        // 创建选中背景
        UIImageView *selectedBgView = [[UIImageView alloc] init];
        self.selectedBackgroundView = selectedBgView;
        self.selectedBgView = selectedBgView;
    }
    return self;
}

- (void)setItem:(SettingItem *)item {
    
    _item = item;
    
    // 1.设置数据
    [self setupData];
    
    // 2.设置右边的控件
    [self setupRightView];
}

- (void)setIndexPath:(NSIndexPath *)indexPath {
    
    _indexPath = indexPath;

    // 设置背景的图片
    long totalRows = [self.tableView numberOfRowsInSection:indexPath.section];
    
    NSString *bgName = nil;
    
    if (totalRows == 1) { // 设置该组的第一行
        bgName = kSettingViewCommonRowCellBackgroundImageGroupFirst;
    } else if (indexPath.row == totalRows - 1) { // 设置该组的尾行
        bgName = kSettingViewCommonRowCellBackgroundImageGroupMiddle;
    } else { // 设置该组的最后一行
        bgName = kSettingViewCommonRowCellBackgroundImageGroupLast;
    }
    
    self.bgView.image = [UIImage resizedImageWithName:bgName];
    self.selectedBgView.image = [UIImage resizedImageWithName:kSettingViewCommonRowCellSelectedBackgroundImage];
}

/**
 *  设置数据
 */
- (void)setupData {
    // 1.设置图标
    self.imageView.image = [UIImage imageNamed:self.item.icon];
    // 2.设置标题
    self.textLabel.text = self.item.title;
    // 3.设置标题文本颜色
    self.textLabel.textColor = self.item.titleColor;
    // 4.设置子标题
    self.detailTextLabel.text = self.item.subTitle;
    // 5.设置子标题文本颜色
    self.detailTextLabel.textColor = self.item.subTitleColor;
}

/**
 *  设置右边的控件
 */
- (void)setupRightView {
    
    // 清空之前view中得视图
    self.accessoryView = nil;
    
    if (self.item.badgeValue) { // 右边是带数字的按钮
        
        self.badgeButton.badgeValue = self.item.badgeValue;
        self.accessoryView = self.badgeButton;
        
    } else if ([self.item isKindOfClass:[SettingSwitchItem class]]){ // 右边是开关
        
        self.accessoryView = self.switchView;
        
    } else if ([self.item isKindOfClass:[SettingArrowItem class]]){ // 右边是箭头
        
        self.accessoryView = self.arrowView;
        
    } else if ([self.item isKindOfClass:[SettingLabelItem class]]){ // 右边是标签
        
        SettingLabelItem *item = (SettingLabelItem *)self.item;
        
        if (self.item.arrow) {
            self.accessoryView = [self viewWithArrow:item.lableView];
        } else {
            self.accessoryView = item.lableView;
        }
        
    } else if ([self.item isKindOfClass:[SettingTextItem class]]){ // 右边是输入框
        
        SettingTextItem *item = (SettingTextItem *)self.item;
        
        if (self.item.arrow) {
            self.accessoryView = [self viewWithArrow:item.textField];
        } else {
            self.accessoryView = item.textField;
        }
        
    } else if ([self.item isKindOfClass:[SettingImageItem class]]){ // 右边是图片框
        
        SettingImageItem *item = (SettingImageItem *)self.item;
        
        if (self.item.arrow) {
            self.accessoryView = [self viewWithArrow:item.imageView];
        } else {
            self.accessoryView = item.imageView;
        }
        
    } else if ([self.item isKindOfClass:[SettingCustomItem class]]){ // 右边是自定义view
        
        SettingCustomItem *item = (SettingCustomItem *)self.item;
        
        if (self.item.arrow) {
            self.accessoryView = [self viewWithArrow:item.customView];
        } else {
            self.accessoryView = item.customView;
        }
    }
}

/**
 *  给自定义view包装一个带有箭头的view
 */
- (UIView *)viewWithArrow:(UIView *)customView {
    
    UIView *container = [[UIView alloc] init];
    
    [container addSubview:customView];
    
    CGFloat arrowViewW = kSettingViewCommonRowCellArrowViewWidth;
    CGFloat arrowViewH = kSettingViewCommonRowCellArrowViewHeight;
    CGFloat arrowViewX = customView.frame.origin.x + customView.frame.size.width;
    CGFloat arrowViewY = customView.frame.size.height * 0.5 - arrowViewH * 0.5;
    
    self.arrowView.frame = CGRectMake(arrowViewX, arrowViewY, arrowViewW, arrowViewH);
    
    [container addSubview:self.arrowView];
    
    CGFloat containerW = customView.frame.size.width + self.arrowView.frame.size.width;
    CGFloat containerH = customView.frame.size.height;
    
    container.frame = CGRectMake(0, 0, containerW, containerH);
    
    return container;
}

@end
