//
//  WYCAddcardController.m
//  初试
//
//  Created by 中企互联 on 2017/10/12.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCAddcardController.h"

@interface WYCAddcardController ()<UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,strong)UITableView * tableView;

@end
static NSString * ID = @"tag";
@implementation WYCAddcardController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Nav按钮及颜色
    [self setupNavButton];
    
    //表视图
    [self setupTableView];
}
- (void)setupTableView{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 140 * px * 6) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    
    //保存按钮
    UIButton *SaveButton = [[UIButton alloc] init];
    SaveButton.frame = CGRectMake(40 * px, CGRectGetMaxY(self.tableView.frame) + 160 * px, ScreenWidth - 80 * px, 160 * px);
    SaveButton.layer.cornerRadius = 5;
    SaveButton.backgroundColor = WYCRGBColor(239, 177, 22);
    [SaveButton setTitle:@"保存" forState:UIControlStateNormal];
    [SaveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:SaveButton];
}
//Nav按钮及颜色
- (void)setupNavButton{
    self.navigationItem.title = @"添加信用卡";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 6;
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
    
    CGFloat cellclearC = 20 * px;
    
    if (indexPath.row == 0){
        UIView * cellView = [[UIView alloc] init];
        cellView.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        [cell addSubview:cellView];
        
        //姓名label
        UILabel * userlabel = [[UILabel alloc] init];
        userlabel.frame = CGRectMake(cellX, cellX, 180 * px, cellH);
        userlabel.textAlignment = NSTextAlignmentCenter;
        userlabel.text = @"姓名：";
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
        userlabel.text = @"卡号：";
        userlabel.font = [UIFont systemFontOfSize:56 * px];
        [cellView addSubview:userlabel];
        
        
        
        
        //姓名name
        UILabel * namelabel = [[UILabel alloc] init];
        namelabel.frame = CGRectMake(CGRectGetMaxX(userlabel.frame) + cellclearC, userlabel.y, ScreenWidth / 2, cellH);
        namelabel.text = @"123 456 78 8901";
        namelabel.font = [UIFont systemFontOfSize:56 * px];
        [cellView addSubview:namelabel];
        
    }
    else if (indexPath.row == 2){
        UIView * cellView = [[UIView alloc] init];
        cellView.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        [cell addSubview:cellView];
        
        //银行label
        UILabel * userlabel = [[UILabel alloc] init];
        userlabel.frame = CGRectMake(cellX, cellX, 180 * px, cellH);
        userlabel.text = @"银行：";
        userlabel.font = [UIFont systemFontOfSize:56 * px];
        [cellView addSubview:userlabel];
        
        
        //银行name
        UILabel * namelabel = [[UILabel alloc] init];
        namelabel.frame = CGRectMake(CGRectGetMaxX(userlabel.frame) + cellclearC, userlabel.y, ScreenWidth / 2, cellH);
        namelabel.text = @"中信银行";
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
        userlabel.text = @"有效期：";
        userlabel.font = [UIFont systemFontOfSize:56 * px];
        [cellView addSubview:userlabel];
        
        
        
        //姓名name
        UILabel * namelabel = [[UILabel alloc] init];
        namelabel.frame = CGRectMake(CGRectGetMaxX(userlabel.frame) + cellclearC, userlabel.y, ScreenWidth / 2, cellH);
        namelabel.text = @"2018/06";
        namelabel.font = [UIFont systemFontOfSize:56 * px];
        [cellView addSubview:namelabel];
        
    }else if (indexPath.row == 4){
        UIView * cellView = [[UIView alloc] init];
        cellView.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        [cell addSubview:cellView];
        
        //姓名label
        UILabel * userlabel = [[UILabel alloc] init];
        userlabel.frame = CGRectMake(cellX, cellX, 240 * px, cellH);
        userlabel.text = @"CVN2:";
        userlabel.font = [UIFont systemFontOfSize:56 * px];
        [cellView addSubview:userlabel];
        
        
        //姓名name
        UILabel * namelabel = [[UILabel alloc] init];
        namelabel.frame = CGRectMake(CGRectGetMaxX(userlabel.frame) + cellclearC, userlabel.y, ScreenWidth, cellH);
        namelabel.text = @"888";
        namelabel.font = [UIFont systemFontOfSize:56 * px];
        [cellView addSubview:namelabel];
        
    }else{
        UIView * cellView = [[UIView alloc] init];
        cellView.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        [cell addSubview:cellView];

        //姓名label
        UILabel * userlabel = [[UILabel alloc] init];
        userlabel.frame = CGRectMake(cellX, cellX, 240 * px, cellH);
        userlabel.text = @"手机号:";
        userlabel.font = [UIFont systemFontOfSize:56 * px];
        [cellView addSubview:userlabel];

        //输入手机号
        UITextField *userfield = [[UITextField alloc] init];
        userfield.frame = CGRectMake(CGRectGetMaxX(userlabel.frame) + cellclearC, userlabel.y, ScreenWidth, userlabel.height);
        userfield.placeholder = @"银行预留手机号";
        [cellView addSubview:userfield];
    }
    return cell;
}
@end
