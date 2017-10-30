//
//  WYCRmtController.m
//  初试
//
//  Created by 中企互联 on 2017/10/10.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCRmtController.h"
#import "WYCRmtCell.h"
#import "WYCAddCardController.h"
#import "WYCSeeBillController.h"
@interface WYCRmtController ()<UITableViewDelegate,UITableViewDataSource>
/** 表视图*/
@property(nonatomic,strong)UITableView * tableView;

@end

@implementation WYCRmtController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置Nav按钮及颜色
    [self setupNavButton];
    [self setupTableView];
}
//表视图
- (void)setupTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    //    self.tableView.backgroundColor = [UIColor redColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    
}
//Nav按钮及颜色
- (void)setupNavButton{
    self.navigationItem.title = @"还款";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
    
    //左侧按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"add" hight:@"add" target:self action:@selector(addClick)];
}
- (void)addClick{
    WYCAddCardController * addController = [[WYCAddCardController alloc] init];
    [self.navigationController pushViewController:addController animated:NO];
}
#pragma ----------->列表
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 640 * px;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    /** 分割线72*px */
    //    tableView.separatorColor = WYZGrayBg;
    //    tableView.separatorInset = UIEdgeInsetsMake(0,72*px, 0, 72*px);        // 设置端距，这里表示separator离左边和右边均80像素
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    tableView.tableFooterView = [[UIView alloc] init];
    
    WYCRmtCell * cell = [WYCRmtCell cellWithTableView:tableView];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WYCSeeBillController * seebillNav = [[WYCSeeBillController alloc] init];
    [self.navigationController pushViewController:seebillNav animated:NO];
}
@end
