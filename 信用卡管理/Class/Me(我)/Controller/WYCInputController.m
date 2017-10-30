//
//  WYCInputController.m
//  初试
//
//  Created by 中企互联 on 2017/10/13.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCInputController.h"

@interface WYCInputController ()<UITableViewDelegate,UITableViewDataSource>

/**
 *列表
 */
@property (nonatomic,strong)UITableView * tableView;

@end
static NSString * ID = @"tag";
@implementation WYCInputController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Nav字体颜色 + 背景
    [self setupNav];
    
    
    //表视图设置
    
    [self setupTabelView];
    
}
//表视图设置

- (void)setupTabelView{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 140 * px * 4) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:self.tableView];
    
}
//Nav字体颜色+ 背景
- (void)setupNav {
    self.navigationItem.title = @"手动账单";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
    
    
    
    UIButton *SubmitButton = [[UIButton alloc] init];
    SubmitButton.frame = CGRectMake(40 * px, 140 * px * 8, ScreenWidth - 80 * px, 160 * px);
    SubmitButton.layer.cornerRadius = 5;
    SubmitButton.backgroundColor = WYCRGBColor(239, 177, 22);
    [SubmitButton setTitle:@"保存" forState:UIControlStateNormal];
    [SubmitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:SubmitButton];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 140 * px;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    if (indexPath.row == 0 || indexPath.row == 1) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
    }else{
        
        
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
        userlabel.frame = CGRectMake(cellX, cellX, 250 * px, cellH);
        userlabel.textAlignment = NSTextAlignmentCenter;
        userlabel.text = @"信用卡：";
        userlabel.font = [UIFont systemFontOfSize:56 * px];
        [cellView addSubview:userlabel];
        
        
        //姓名name
        UILabel * namelabel = [[UILabel alloc] init];
        namelabel.frame = CGRectMake(CGRectGetMaxX(userlabel.frame), userlabel.y, ScreenWidth / 1.5, cellH);
        namelabel.text = @"招商银行 刘志浩 尾号（8888）";
        namelabel.textAlignment = NSTextAlignmentRight;
        namelabel.font = [UIFont systemFontOfSize:56 * px];
        [cellView addSubview:namelabel];
        
    }else if (indexPath.row == 1){
        UIView * cellView = [[UIView alloc] init];
        cellView.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        [cell addSubview:cellView];
        
        //姓名label
        UILabel * userlabel = [[UILabel alloc] init];
        userlabel.frame = CGRectMake(cellX, cellX, 250 * px, cellH);
        userlabel.textAlignment = NSTextAlignmentCenter;
        userlabel.text = @"账单日：";
        userlabel.font = [UIFont systemFontOfSize:56 * px];
        [cellView addSubview:userlabel];
        
        
        
        
        //姓名name
        UILabel * namelabel = [[UILabel alloc] init];
        namelabel.frame = CGRectMake(CGRectGetMaxX(userlabel.frame) + cellclearC, userlabel.y, ScreenWidth / 1.5, cellH);
        namelabel.text = @"08日";
        namelabel.textAlignment = NSTextAlignmentRight;
        namelabel.font = [UIFont systemFontOfSize:56 * px];
        [cellView addSubview:namelabel];
        
    }
    else if (indexPath.row == 2){
        UIView * cellView = [[UIView alloc] init];
        cellView.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        [cell addSubview:cellView];
        
        //姓名label
        UILabel * userlabel = [[UILabel alloc] init];
        userlabel.frame = CGRectMake(cellX, cellX, 300 * px, cellH);
        userlabel.textAlignment = NSTextAlignmentCenter;
        userlabel.text = @"信用额度：";
        userlabel.font = [UIFont systemFontOfSize:56 * px];
        [cellView addSubview:userlabel];
        
        
        //姓名name
        UILabel * namelabel = [[UILabel alloc] init];
        namelabel.frame = CGRectMake(ScreenWidth / 2 - 40 * px, userlabel.y, ScreenWidth / 2, cellH);
        namelabel.text = @"20,000.00";
        namelabel.textAlignment = NSTextAlignmentRight;
        namelabel.font = [UIFont systemFontOfSize:56 * px];
        [cellView addSubview:namelabel];
        
    }
    else {
        UIView * cellView = [[UIView alloc] init];
        cellView.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        [cell addSubview:cellView];
        
        //姓名label
        UILabel * userlabel = [[UILabel alloc] init];
        userlabel.frame = CGRectMake(cellX, cellX, 300 * px, cellH);
        userlabel.textAlignment = NSTextAlignmentCenter;
        userlabel.text = @"账单金额：";
        userlabel.font = [UIFont systemFontOfSize:56 * px];
        [cellView addSubview:userlabel];
        
        
        
        //姓名name
        UILabel * namelabel = [[UILabel alloc] init];
        namelabel.frame = CGRectMake(ScreenWidth / 2 - 40 * px, userlabel.y, ScreenWidth / 2, cellH);
        namelabel.textAlignment = NSTextAlignmentRight;
        namelabel.text = @"324.00";
        namelabel.font = [UIFont systemFontOfSize:56 * px];
        [cellView addSubview:namelabel];
        
    }
    
    return cell;
}
@end
