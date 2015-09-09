# SXSettingTable
# 可扩展型静态表格

example:

- (void)setupGroup0 {
    
    SettingGroup *group = [self addGroup];
    
    group.header = @"SettingArrowItem header";
    
    group.footer = @"SettingArrowItem footer";
    
    SettingArrowItem *settingSwitchItem1 = [SettingArrowItem itemWithTitle:@"测试"];
    
    SettingArrowItem *settingSwitchItem2 = [SettingArrowItem itemWithIcon:@"new_friend" title:@"测试"];
    
    SettingArrowItem *settingSwitchItem3 = [SettingArrowItem itemWithIcon:@"new_friend" title:@"测试" subTitle:@"小测试"];
    
    SettingArrowItem *settingSwitchItem4 = [SettingArrowItem itemWithIcon:@"new_friend" title:@"测试" subTitle:@"小测试" destVcClass:[UIViewController class]];
    
    settingSwitchItem4.operation = ^{
    
        //在这里跳转到下一个控制器也可以哟
        
    };
    
    group.items = @[settingSwitchItem1, settingSwitchItem2, settingSwitchItem3, settingSwitchItem4];
    
}

- (void)setupGroup2 {
    
    SettingGroup *group = [self addGroup];
    
    group.header = @"SettingLabelItem header";
    
    group.footer = @"SettingLabelItem footer";
    
    SettingLabelItem *settingLabelItem1 = [SettingLabelItem itemWithTitle:@"测试" content:@"内容"];
    
    SettingLabelItem *settingLabelItem2 = [SettingLabelItem itemWithIcon:@"card" title:@"测试" content:@"内容"];
    
    SettingLabelItem *settingLabelItem3 = [SettingLabelItem itemWithIcon:@"card" title:@"测试" subTitle:@"小测试" content:@"内容"];
    
    SettingLabelItem *settingLabelItem4 = [SettingLabelItem itemWithIcon:@"card" title:@"测试" subTitle:@"小测试" content:@"内容"];
    
    settingLabelItem4.lableView.textColor = [UIColor redColor];
    
    settingLabelItem4.arrow = YES;
    
    settingLabelItem4.operation = ^{
    
        //在这里跳转到下一个控制器也可以哟
        
    };
    
    group.items = @[settingLabelItem1, settingLabelItem2, settingLabelItem3, settingLabelItem4];
    
}

- (void)setupGroup3 {
    
    SettingGroup *group = [self addGroup];
    
    group.header = @"SettingTextItem header";
    
    group.footer = @"SettingTextItem footer";
    
    SettingTextItem *settingTextItem1 = [SettingTextItem itemWithTitle:@"测试" content:@"内容"];
    
    settingTextItem1.textField.borderStyle = UITextBorderStyleNone;
    
    SettingTextItem *settingTextItem2 = [SettingTextItem itemWithIcon:@"vip" title:@"测试" content:@"内容"];
    
    settingTextItem2.textField.borderStyle = UITextBorderStyleLine;
    
    SettingTextItem *settingTextItem3 = [SettingTextItem itemWithIcon:@"vip" title:@"测试" subTitle:@"小测试" content:@"内容"];
    
    settingTextItem3.textField.borderStyle = UITextBorderStyleBezel;
    
    SettingTextItem *settingTextItem4 = [SettingTextItem itemWithIcon:@"vip" title:@"测试" subTitle:@"小测试" content:@"内容"];
    
    settingTextItem4.textField.borderStyle = UITextBorderStyleRoundedRect;
    
    settingTextItem4.textField.textColor = [UIColor redColor];
    
    settingTextItem4.arrow = YES;
    
    settingTextItem4.operation = ^{
    
        //在这里跳转到下一个控制器也可以哟
        
    };
    
    group.items = @[settingTextItem1, settingTextItem2, settingTextItem3, settingTextItem4];
}

- (void)setupGroup4 {
    
    SettingGroup *group = [self addGroup];
    
    group.header = @"SettingImageItem header";
    
    group.footer = @"SettingImageItem footer";
    
    SettingImageItem *settingImageItem1 = [SettingImageItem itemWithTitle:@"测试" image:[UIImage imageNamed:@"card"]];
    
    SettingImageItem *settingImageItem2 = [SettingImageItem itemWithIcon:@"collect" title:@"测试" image:[UIImage imageNamed:@"card"]];
    
    SettingImageItem *settingImageItem3 = [SettingImageItem itemWithIcon:@"collect" title:@"测试" subTitle:@"小测试" image:[UIImage imageNamed:@"card"]];
    
    SettingImageItem *settingImageItem4 = [SettingImageItem itemWithIcon:@"collect" title:@"测试" subTitle:@"小测试" image:nil];
    
    settingImageItem4.imageView.image = [UIImage imageNamed:@"collect"];
    
    settingImageItem4.arrow = YES;
    
    settingImageItem4.operation = ^{
    
        //在这里跳转到下一个控制器也可以哟
        
    };
    
    group.items = @[settingImageItem1, settingImageItem2, settingImageItem3, settingImageItem4];
    
}

- (void)setupGroup5 {
    
    SettingGroup *group = [self addGroup];
    
    group.header = @"SettingSwitchItem header";
    
    group.footer = @"SettingSwitchItem footer";
    
    SettingSwitchItem *settingSwitchItem1 = [SettingSwitchItem itemWithTitle:@"双色球" key:@"setting_ssq"];
    
    SettingSwitchItem *settingSwitchItem2 = [SettingSwitchItem itemWithIcon:@"like" title:@"大乐透" subTitle:@"每周一、三、六开奖" key:@"setting_dlt"];
    
    SettingSwitchItem *settingSwitchItem3 = [SettingSwitchItem itemWithIcon:@"like" title:@"七星彩" subTitle:@"每天开奖" key:@"setting_qxc"];
    
    settingSwitchItem3.arrow = YES;
    
    settingSwitchItem3.operation = ^{
    
        //在这里跳转到下一个控制器也可以哟
        
    };

    settingSwitchItem3.switchValueChangedHandler = ^{
        //当开关状态改变事件
    };
    
    group.items = @[settingSwitchItem1, settingSwitchItem2, settingSwitchItem3];
    
}

- (void)setupGroup6 {
    
    SettingGroup *group = [self addGroup];
    
    group.header = @"SettingCustomItem header";
    
    group.footer = @"SettingCustomItem footer";
    
    SettingCustomItem *settingCustomItem1 = [SettingCustomItem itemWithTitle:@"测试" customView:[UIButton buttonWithType:UIButtonTypeContactAdd]];
    
    SettingCustomItem *settingCustomItem2 = [SettingCustomItem itemWithIcon:@"pay" title:@"测试" customView:[UIButton buttonWithType:UIButtonTypeInfoDark]];
    
    SettingCustomItem *settingCustomItem3 = [SettingCustomItem itemWithIcon:@"pay" title:@"测试" subTitle:@"小测试" customView:[[UISlider alloc] init]];
    
    SettingCustomItem *settingCustomItem4 = [SettingCustomItem itemWithIcon:@"pay" title:@"测试" subTitle:@"小测试" customView:[[UIStepper alloc] init]];
    
    settingCustomItem4.arrow = YES;
    
    settingCustomItem4.operation = ^{
    
        //在这里跳转到下一个控制器也可以哟
        
    };
    
    group.items = @[settingCustomItem1, settingCustomItem2, settingCustomItem3, settingCustomItem4];
    
}

根据需求重写父类代理方法来调整样式

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == 0) {
    
        return 64.0f;
        
    }
    
    return [super tableView:tableView heightForRowAtIndexPath:indexPath];
    
}
