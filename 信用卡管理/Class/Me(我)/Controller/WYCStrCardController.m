

//
//  WYCStrCardController.m
//  初试
//
//  Created by 中企互联 on 2017/10/13.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCStrCardController.h"
#import "WYCStrCardCell.h"
#import "WYCRmtCell.h"
@interface WYCStrCardController ()<UITableViewDelegate,UITableViewDataSource>

/**
 *列表
 */
@property (nonatomic,strong)UITableView * tableView;

@end
static NSString * ID = @"tag";
@implementation WYCStrCardController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Nav字体颜色 + 背景
    
    [self setupNav];
    
    
    //表视图设置
    
    [self setupTabelView];
}

//表视图设置

- (void)setupTabelView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    
}

//Nav字体颜色+ 背景
- (void)setupNav {
    self.navigationItem.title = @"隐藏卡片管理";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 240 * px;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    /** 分割线72*px */
    //    tableView.separatorColor = WYZGrayBg;
//    //    tableView.separatorInset = UIEdgeInsetsMake(0,72*px, 0, 72*px);        // 设置端距，这里表示separator离左边和右边均80像素
//    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
//    tableView.tableFooterView = [[UIView alloc] init];
    
    WYCStrCardCell * cell = [WYCStrCardCell cellWithTableView:tableView];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}


@end
