//
//  WYCMemineController.m
//  初试
//
//  Created by 中企互联 on 2017/10/12.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCMemineController.h"
#import "WYCSetcardController.h"
#import "WYCSetUserController.h"
@interface WYCMemineController ()<UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,strong)UITableView * tableView;
@end
static NSString * ID = @"tag";
@implementation WYCMemineController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Nav按钮及颜色
    [self setupNavButton];
    
    
    //表视图
    [self setupTableView];
    
    
}
- (void)setupTableView{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}
//Nav按钮及颜色
- (void)setupNavButton{
    self.navigationItem.title = @"我的信息";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 140 * px;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
     tableView.tableFooterView = [[UIView alloc] init];
    tableView.scrollEnabled = NO;
    
    CGFloat pushViweH = 140 * px;
    CGFloat cellX = 40 * px;
    CGFloat cellH = 60 * px;
    
//    CGFloat pushViweH = cellH + cellX * 3;
    
    CGFloat cellclearC = 20 * px;
    
    if (indexPath.row == 0){
        UIView * cellView = [[UIView alloc] init];
        cellView.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        [cell addSubview:cellView];
        
        //姓名label
        UILabel * userlabel = [[UILabel alloc] init];
        userlabel.frame = CGRectMake(cellX, cellX, 130 * px, cellH);
        userlabel.textAlignment = NSTextAlignmentCenter;
        userlabel.text = @"姓名";
        userlabel.font = [UIFont systemFontOfSize:56 * px];
        [cellView addSubview:userlabel];
        
        
        //姓名name
        UILabel * namelabel = [[UILabel alloc] init];
        namelabel.frame = CGRectMake(CGRectGetMaxX(userlabel.frame) + cellclearC, userlabel.y, ScreenWidth / 2, cellH);
        namelabel.text = @"刘志浩";
        namelabel.font = [UIFont systemFontOfSize:56 * px];
        [cellView addSubview:namelabel];
        
    }else if (indexPath.row == 1){
        UIView * cellView = [[UIView alloc] init];
        cellView.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        [cell addSubview:cellView];
        
        //姓名label
        UILabel * userlabel = [[UILabel alloc] init];
        userlabel.frame = CGRectMake(cellX, cellX, 180 * px, cellH);
        userlabel.textAlignment = NSTextAlignmentCenter;
        userlabel.text = @"手机号";
        userlabel.font = [UIFont systemFontOfSize:56 * px];
        [cellView addSubview:userlabel];
        
        
        UIButton *SetButton = [[UIButton alloc] init];
        SetButton.frame = CGRectMake(ScreenWidth - 120 * px - 40 * px,userlabel.x, 120 * px, cellH);
        SetButton.titleLabel.font = [UIFont systemFontOfSize:BigMiddleFont];
        [SetButton setTitle:@"更换" forState:UIControlStateNormal];
        [SetButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [cellView addSubview:SetButton];
        
        //姓名name
        UILabel * namelabel = [[UILabel alloc] init];
        namelabel.frame = CGRectMake(CGRectGetMaxX(userlabel.frame) + cellclearC, userlabel.y, ScreenWidth / 2, cellH);
        namelabel.text = @"12345678901";
        namelabel.font = [UIFont systemFontOfSize:56 * px];
        [cellView addSubview:namelabel];
        
    }
    else if (indexPath.row == 2){
        UIView * cellView = [[UIView alloc] init];
        cellView.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        [cell addSubview:cellView];
        
        //姓名label
        UILabel * userlabel = [[UILabel alloc] init];
        userlabel.frame = CGRectMake(cellX, cellX, 240 * px, cellH);
        userlabel.textAlignment = NSTextAlignmentCenter;
        userlabel.text = @"身份证号";
        userlabel.font = [UIFont systemFontOfSize:56 * px];
        [cellView addSubview:userlabel];
        
        
        //姓名name
        UILabel * namelabel = [[UILabel alloc] init];
        namelabel.frame = CGRectMake(CGRectGetMaxX(userlabel.frame) + cellclearC, userlabel.y, ScreenWidth / 2, cellH);
        namelabel.text = @"11111111111111111111111";
        namelabel.font = [UIFont systemFontOfSize:56 * px];
        [cellView addSubview:namelabel];
        
    }
    else if (indexPath.row == 3){
        UIView * cellView = [[UIView alloc] init];
        cellView.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        [cell addSubview:cellView];
        
        //姓名label
        UILabel * userlabel = [[UILabel alloc] init];
        userlabel.frame = CGRectMake(cellX, cellX, 240 * px, cellH);
        userlabel.textAlignment = NSTextAlignmentCenter;
        userlabel.text = @"银行卡号";
        userlabel.font = [UIFont systemFontOfSize:56 * px];
        [cellView addSubview:userlabel];
        
        UIButton *SetButton = [[UIButton alloc] init];
        SetButton.frame = CGRectMake(ScreenWidth - 120 * px - 40 * px,userlabel.x, 120 * px, cellH);
        SetButton.titleLabel.font = [UIFont systemFontOfSize:BigMiddleFont];
        [SetButton setTitle:@"更换" forState:UIControlStateNormal];
        [SetButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [cellView addSubview:SetButton];
        
        //姓名name
        UILabel * namelabel = [[UILabel alloc] init];
        namelabel.frame = CGRectMake(CGRectGetMaxX(userlabel.frame) + cellclearC, userlabel.y, ScreenWidth / 2, cellH);
        namelabel.text = @"招商银行 11111111111111111";
        namelabel.font = [UIFont systemFontOfSize:56 * px];
        [cellView addSubview:namelabel];
        
    }
    else{
        UIView * cellView = [[UIView alloc] init];
        cellView.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        [cell addSubview:cellView];
        
        //姓名label
        UILabel * userlabel = [[UILabel alloc] init];
        userlabel.frame = CGRectMake(cellX, cellX, 240 * px, cellH);
        userlabel.textAlignment = NSTextAlignmentCenter;
        userlabel.text = @"注册时间";
        userlabel.font = [UIFont systemFontOfSize:56 * px];
        [cellView addSubview:userlabel];
        
        
        //姓名name
        UILabel * namelabel = [[UILabel alloc] init];
        namelabel.frame = CGRectMake(CGRectGetMaxX(userlabel.frame) + cellclearC, userlabel.y, ScreenWidth, cellH);
        namelabel.text = @"2017年09月05日 16：00：10";
        namelabel.font = [UIFont systemFontOfSize:56 * px];
        [cellView addSubview:namelabel];
        
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        WYCSetUserController * SetUsercontroller = [[WYCSetUserController alloc] init];
        [self.navigationController pushViewController:SetUsercontroller animated:NO];
        
        // 取消选中状态
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    }
    if (indexPath.row == 3){
        
        WYCSetcardController * setcardController = [[WYCSetcardController alloc] init];
        [self.navigationController pushViewController:setcardController animated:NO];
    }
}
@end
