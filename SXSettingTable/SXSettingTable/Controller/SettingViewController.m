//
//  SettingViewController.m
//  SXSettingTable
//
//  Created by 沧海小鱼 on 15/7/7.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingCell.h"

@implementation SettingViewController

- (NSMutableArray *)groups {
    if (!_groups) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

- (SettingGroup *)addGroup {
    
    SettingGroup *group = [SettingGroup group];
    
    [self.groups addObject:group];
    
    return group;
}

- (id)initWithStyle:(UITableViewStyle)style {
    
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (id)init {
    
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView.bounces = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.backgroundView = kSettingViewCommonRowTableViewBackgroundView;
    self.tableView.backgroundColor = kSettingViewCommonRowTableViewBackgroundColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.sectionHeaderHeight = kSettingViewCommonRowTableViewSectionHeaderHeight;
    self.tableView.sectionFooterHeight = kSettingViewCommonRowTableViewSectionFooterHeight;
    if (iOS7_OR_LATER) {
        self.tableView.contentInset = kSettingViewCommonRowTableViewContentInset;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    SettingGroup *group = self.groups[section];
    
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SettingCell *cell = [SettingCell cellWithTableView:tableView];
    
    SettingGroup *group = self.groups[indexPath.section];
    
    cell.item = group.items[indexPath.row];
    cell.indexPath = indexPath;
    
    if (self.disabledCellSelection) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

#pragma mark - tableView delegate

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    
    SettingGroup *group = self.groups[section];
    
    return group.footer;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    SettingGroup *group = self.groups[section];
    
    return group.header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return kSettingViewCommonRowCellH;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 1.取出模型
    SettingGroup *group = self.groups[indexPath.section];
    SettingItem *item = group.items[indexPath.row];
    
    // 2.操作
    if (item.operation) {
        item.operation();
    }
    
    // 3.跳转
    if ([item isKindOfClass:[SettingArrowItem class]]) {
        SettingArrowItem *arrowItem = (SettingArrowItem *)item;
        if (arrowItem.destVcClass) {
            if (self.navigationController) {
                UIViewController *destVc = [[arrowItem.destVcClass alloc] init];
                destVc.title = arrowItem.title;
                [self.navigationController pushViewController:destVc animated:YES];
            } else {
                NSLog(@"This navigation controller was nil ");
            }
        }
    }
}

@end
