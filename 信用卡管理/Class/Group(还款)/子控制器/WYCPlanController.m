//
//  WYCTranslationController.m
//  初试
//
//  Created by 中企互联 on 2017/10/16.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCPlanController.h"

@interface WYCPlanController ()

@end

@implementation WYCPlanController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
}

- (void)setupTableView
{
    // 设置内边距
    CGFloat bottom = self.tabBarController.tabBar.height;
    CGFloat top = 640 * px;
    self.tableView.contentInset = UIEdgeInsetsMake(top, 0, bottom, 0);
    self.tableView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    // 设置滚动条的内边距
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 100;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    /** 分割线72*px */
    
    tableView.separatorColor = WYZGrayBg;
    tableView.separatorInset = UIEdgeInsetsMake(0,72*px, 0, 72*px);        // 设置端距，这里表示separator离左边和右边均80像素
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id"];
    }
    return cell;
}
@end


