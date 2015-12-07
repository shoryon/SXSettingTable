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

#define kSettingViewCommonRowCellAccessoryViewW 20.0f

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
@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UILabel *titleView;
@property (nonatomic, weak) UILabel *subTitleView;

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
    
    if (item.switchValueChangedHandler) {
        item.switchValueChangedHandler();
    }
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
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupViews];
    }
    return self;
}

- (void)setItem:(SettingItem *)item {
    
    _item = item;
    
    // 设置控件中数据
    [self setupViewsData];
    // 初始化控件
    [self setupAccessoryView];
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
 *  初始化控件
 */
- (void)setupViews {
    
    self.backgroundColor = [UIColor clearColor];
    
    // 图标
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.backgroundColor = [UIColor clearColor];
    [self addSubview:iconView];
    self.iconView = iconView;

    // 标题
    UILabel *titleView = [[UILabel alloc] init];
    titleView.backgroundColor = [UIColor clearColor];
    titleView.textColor = kSettingViewCommonRowCellTitleLableTextColor;
    titleView.font = [UIFont systemFontOfSize:kSettingViewCommonRowCellTitleLableFontSize];
    [self addSubview:titleView];
    self.titleView = titleView;
    
    // 子标题
    UILabel *subTitleView = [[UILabel alloc] init];
    subTitleView.backgroundColor = [UIColor clearColor];
    subTitleView.textColor = kSettingViewCommonRowCellSubTitleLableTextColor;
    subTitleView.font = [UIFont systemFontOfSize:kSettingViewCommonRowCellSubTitleLableFontSize];
    [self addSubview:subTitleView];
    self.subTitleView = subTitleView;
    
    // 创建背景
    UIImageView *bgView = [[UIImageView alloc] init];
    self.backgroundView = bgView;
    self.bgView = bgView;
    
    // 创建选中背景
    UIImageView *selectedBgView = [[UIImageView alloc] init];
    self.selectedBackgroundView = selectedBgView;
    self.selectedBgView = selectedBgView;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat titleViewX = kSettingViewCommonRowCellIconViewBorder;
    CGFloat titleViewY = 0.0f;
    
    //设置图标
    if (!self.iconView.hidden) {
        CGFloat iconViewW = kSettingViewCommonRowCellIconViewSize.width;
        CGFloat iconViewH = kSettingViewCommonRowCellIconViewSize.height;
        CGFloat iconViewX = kSettingViewCommonRowCellIconViewBorder;
        CGFloat iconViewY = self.frame.size.height * 0.5 - iconViewH * 0.5;
        self.iconView.frame = CGRectMake(iconViewX, iconViewY, iconViewW, iconViewH);
        //根据是否存在图标来计算label的位置
        titleViewX = iconViewX + iconViewW + kSettingViewCommonRowCellTitleViewBorder;
    }

    CGFloat titleViewW = self.frame.size.width - self.accessoryView.frame.size.width - titleViewX - kSettingViewCommonRowCellAccessoryViewW;
    CGFloat titleViewH = self.frame.size.height;
    //设置标题和子标题
    if (!self.subTitleView.hidden) { //是否有子标题
        titleViewH = self.frame.size.height * kSettingViewCommonRowCellTitleLableHeightScale;
        self.titleView.frame = CGRectMake(titleViewX, titleViewY, titleViewW, titleViewH);
        CGFloat subTitleViewX = titleViewX;
        CGFloat subTitleViewY = titleViewY + titleViewH;
        CGFloat subTitleViewW = titleViewW;
        CGFloat subTitleViewH = self.frame.size.height * (1 - kSettingViewCommonRowCellTitleLableHeightScale);
        self.subTitleView.frame = CGRectMake(subTitleViewX, subTitleViewY, subTitleViewW, subTitleViewH);
    } else {
        self.titleView.frame = CGRectMake(titleViewX, titleViewY, titleViewW, titleViewH);
    }
}

- (void)setupViewsData {
    
    //设置图标
    if (self.item.icon) {
        self.iconView.hidden = NO;
        self.iconView.image = [UIImage imageNamed:self.item.icon];
    } else {
        self.iconView.hidden = YES;
    }
    
    // 设置标题和文本颜色
    self.titleView.text = self.item.title;
    self.titleView.textColor = self.item.titleColor;
    
    // 设置子标题和文本颜色
    if (self.item.subTitle) {
        self.subTitleView.hidden = NO;
        self.subTitleView.text = self.item.subTitle;
        self.subTitleView.textColor = self.item.subTitleColor;
    } else {
        self.subTitleView.hidden = YES;
    }
}

/**
 *  设置右边的控件
 */
- (void)setupAccessoryView {

    self.accessoryView = nil; //清空之前view中得视图
    
    if (self.item.badgeValue) { //右边是带数字的按钮
        
        self.badgeButton.badgeValue = self.item.badgeValue;
        self.accessoryView = self.badgeButton;
        
    } else if ([self.item isKindOfClass:[SettingSwitchItem class]]){ //右边是开关
        
        self.accessoryView = self.switchView;
        
    } else if ([self.item isKindOfClass:[SettingArrowItem class]]){ //右边是箭头
        
        self.accessoryView = self.arrowView;
        
    } else if ([self.item isKindOfClass:[SettingLabelItem class]]){ //右边是标签
        
        SettingLabelItem *item = (SettingLabelItem *)self.item;
        
        if (self.item.arrow) {
            self.accessoryView = [self viewWithArrow:item.lableView];
        } else {
            self.accessoryView = item.lableView;
        }
        
    } else if ([self.item isKindOfClass:[SettingTextItem class]]){ //右边是输入框
        
        SettingTextItem *item = (SettingTextItem *)self.item;
        
        if (self.item.arrow) {
            self.accessoryView = [self viewWithArrow:item.textField];
        } else {
            self.accessoryView = item.textField;
        }
        
    } else if ([self.item isKindOfClass:[SettingImageItem class]]){ //右边是图片框
        
        SettingImageItem *item = (SettingImageItem *)self.item;
        
        if (self.item.arrow) {
            self.accessoryView = [self viewWithArrow:item.imageView];
        } else {
            self.accessoryView = item.imageView;
        }
        
    } else if ([self.item isKindOfClass:[SettingCustomItem class]]){ //右边是自定义view
        
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
