//
//  WYCMymessegeController.m
//  初试
//
//  Created by 中企互联 on 2017/10/12.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCMymessegeController.h"
#import "WYCMSdetailedController.h"
#import "WYCMessegeCell.h"
@interface WYCMymessegeController ()<UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,strong)UITableView * tableView;

@end

@implementation WYCMymessegeController

- (void)viewDidLoad {
    [super viewDidLoad];
    //NAV按钮及颜色
    [self setupNavButton];
    
    //表视图
    [self setupTableView];
}
//表视图
- (void)setupTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    
}
//Nav按钮及颜色
- (void)setupNavButton{
    self.navigationItem.title = @"消息中心";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 300 * px;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    /** 分割线72*px */
    //    tableView.separatorColor = WYZGrayBg;
    //    tableView.separatorInset = UIEdgeInsetsMake(0,72*px, 0, 72*px);        // 设置端距，这里表示separator离左边和右边均80像素
//    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
//    tableView.tableFooterView = [[UIView alloc] init];
    
    WYCMessegeCell * cell = [WYCMessegeCell cellWithTableView:tableView];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        WYCMSdetailedController * Mscontroller = [[WYCMSdetailedController alloc] init];
        [self.navigationController pushViewController:Mscontroller animated:NO];
        
        // 取消选中状态
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}
@end
