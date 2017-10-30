//
//  WYCBillController.m
//  初试
//
//  Created by 中企互联 on 2017/10/10.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCBillController.h"
#import "PictureRotate.h"
#import "WYCHomeCell.h"
#import "WYCMemineController.h"
#import "WYCMymessegeController.h"
#import "WYCAddcardController.h"
#import "WYCInformationController.h"
@interface WYCBillController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * tableView;
@end
static NSString * ID = @"tag";
@implementation WYCBillController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    //NAV按钮及颜色
    [self setupNavButton];
    
    
    //表视图
    [self setupTableView];
    
    //轮播图
    [self setupScrollView];
}

//表视图
- (void)setupTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    //    self.tableView.backgroundColor = [UIColor redColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:self.tableView];
    
}
//Nav按钮及颜色
- (void)setupNavButton{
    self.navigationItem.title = @"智能信用卡管家";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
 
    //左侧按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"photo" hight:@"photo" target:self action:@selector(photoClick)];
    //右侧两个按钮
    UIButton *addbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addbtn addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
    [addbtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    
    
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithCustomView:addbtn];
    
    
    UIBarButtonItem *messegeItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    messegeItem.width = 22;
    
    
    UIButton *settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [settingBtn addTarget:self action:@selector(messegeClick) forControlEvents:UIControlEventTouchUpInside];
    [settingBtn setImage:[UIImage imageNamed:@"messege"] forState:UIControlStateNormal];
    [settingBtn sizeToFit];
    UIBarButtonItem *settingBtnItem = [[UIBarButtonItem alloc] initWithCustomView:settingBtn];
    
    
    
    self.navigationItem.rightBarButtonItems  = @[addItem,messegeItem,settingBtnItem];
//    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"取消" target:self action:@selector(back)];
    
}

//消息方法
- (void)messegeClick{
    WYCMymessegeController * myControiller = [[WYCMymessegeController alloc] init];
    [self.navigationController pushViewController:myControiller animated:NO];
}
//左侧方法
- (void)photoClick{
    
    WYCMemineController * memineController = [[WYCMemineController alloc] init];
    [self.navigationController pushViewController:memineController animated:YES];
}

//添加方法
- (void)addClick{
    WYCAddcardController * addcontroller = [[WYCAddcardController alloc] init];
    [self.navigationController pushViewController:addcontroller animated:YES];
}
/**
 *轮播图
 */
- (void)setupScrollView {
    
    //滚动视图的XYWH
    CGFloat scrollViewX = 0;
    CGFloat scrollViewY = 0;
    CGFloat scrollViewW = ScreenWidth;
    UIView * scrollView = [[UIView alloc] init];
    
    NSArray *images = @[@"001",@"001",@"001",@"001",@"001"];
    
    PictureRotate *pictureRotate = [[PictureRotate alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 700 * px)];
//    pictureRotate.backgroundColor = [UIColor redColor];
    pictureRotate.images = images;
    pictureRotate.timeInterval = 2.0;
    scrollView.frame = CGRectMake(scrollViewX, scrollViewY, scrollViewW, pictureRotate.height);
    [scrollView addSubview:pictureRotate];
    
    
    self.tableView.tableHeaderView = scrollView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 450 * px;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    
    tableView.tableFooterView = [[UIView alloc] init];
    WYCHomeCell * cell = [WYCHomeCell cellWithTableView:tableView];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WYCInformationController * information = [[WYCInformationController alloc] init];
    [self.navigationController pushViewController:information animated:NO];
}

@end
