//
//  WYCTranslationController.m
//  初试
//
//  Created by 中企互联 on 2017/10/16.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCTranslationController.h"
#import "WYCDTViewCell.h"
#import "WYCHeaderFooterView.h"
@interface WYCTranslationController ()<WYCHeaderFooterViewDelegate>
{
    
    int row;
}
@end

@implementation WYCTranslationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    row = 3;
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
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    WYCHeaderFooterView * head = [WYCHeaderFooterView headFootViewTableView:tableView section:section];
    head.delegate = self;
    return head;
    
}
-(void)reloadTableView
{
    if (row == 3) {
        row = 0;
    }else{
        row = 3;
    }
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return row;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 200 * px;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WYCDTViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[WYCDTViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell" HeightOfRow:50];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
@end
