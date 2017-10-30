//设置控制器
//  WYCSetController.m
//  初试
//
//  Created by 中企互联 on 2017/10/12.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCSetController.h"
#import "WYCFmessgeController.h"
#import "WYCPaymentController.h"
#import "WYCAboutMeController.h"
#import "WYCModifyController.h"
@interface WYCSetController ()<UITableViewDelegate,UITableViewDataSource>

/**
 *列表
 */
@property (nonatomic,strong)UITableView * tableView;

@end
static NSString * ID = @"tag";
@implementation WYCSetController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //Nav字体颜色+ 背景
    
    [self setupNav];
    
    
    //表视图设置
    
    [self setupTabelView];
    
    
}
//表视图设置

- (void)setupTabelView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:self.tableView];
    
}

//Nav字体颜色+ 背景
- (void)setupNav {
    self.navigationItem.title = @"设置";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 160*px;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    if (indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 7) {
        
    }else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
    }
    CGFloat pushViweH = 169 * px;
    CGFloat pictureViewH = 270 * px;
    //label 的X
    
    CGFloat pushimageX = 40 * px;
    //图片的长和宽
    CGFloat pushimageW = 64 * px;
    CGFloat pushimageH = 48*px;
    //间隙
    CGFloat clearH = 71 * px;
    
    if (indexPath.row == 0) {
        
        UIView * push = [[UIView alloc] init];
        push.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        [cell addSubview:push];
        
        
        
        UILabel * pushtitle = [[UILabel alloc] init];
        pushtitle.frame = CGRectMake(pushimageX, 55 * px, 300*px, 48*px);
        pushtitle.text = @"登录密码";
        pushtitle.font = [UIFont systemFontOfSize:WyzFont];
        [push addSubview:pushtitle];
        
    }else if (indexPath.row == 1){
        
        UIView * push = [[UIView alloc] init];
        push.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        [cell addSubview:push];
        
        
        
        UILabel * pushtitle = [[UILabel alloc] init];
        pushtitle.frame = CGRectMake(pushimageX, 55 * px, 300*px, 48*px);
        pushtitle.text = @"支付密码";
        pushtitle.font = [UIFont systemFontOfSize:WyzFont];
        [push addSubview:pushtitle];
        
        
    }else if (indexPath.row == 2){
        
        UIView * push = [[UIView alloc] init];
        push.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        [cell addSubview:push];
        
        
        
        UILabel * pushtitle = [[UILabel alloc] init];
        pushtitle.frame = CGRectMake(pushimageX, 55 * px, 300*px, 48*px);
        pushtitle.text = @"指纹支付";
        pushtitle.font = [UIFont systemFontOfSize:WyzFont];
        [push addSubview:pushtitle];
        
    }else if (indexPath.row == 3){
        
        UIView * push = [[UIView alloc] init];
        push.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        [cell addSubview:push];
        
        
        
        UILabel * pushtitle = [[UILabel alloc] init];
        pushtitle.frame = CGRectMake(pushimageX, 55 * px, 300*px, 48*px);
        pushtitle.text = @"推送提醒";
        pushtitle.font = [UIFont systemFontOfSize:WyzFont];
        [push addSubview:pushtitle];
        
    }else if (indexPath.row == 4){
        
        UIView * push = [[UIView alloc] init];
        push.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        [cell addSubview:push];
        
        
        
        UILabel * pushtitle = [[UILabel alloc] init];
        pushtitle.frame = CGRectMake(pushimageX, 55 * px, 300*px, 48*px);
        pushtitle.text = @"意见反馈";
        pushtitle.font = [UIFont systemFontOfSize:WyzFont];
        [push addSubview:pushtitle];
    }else if (indexPath.row == 5){
        
        UIView * push = [[UIView alloc] init];
        push.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        [cell addSubview:push];
        
        
        
        UILabel * pushtitle = [[UILabel alloc] init];
        pushtitle.frame = CGRectMake(pushimageX, 55 * px, 300*px, 48*px);
        pushtitle.text = @"清除缓存";
        pushtitle.font = [UIFont systemFontOfSize:WyzFont];
        [push addSubview:pushtitle];
        
        
        
        
    }
    else if (indexPath.row == 6){
        
        UIView * push = [[UIView alloc] init];
        push.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        [cell addSubview:push];
        
        
        
        UILabel * pushtitle = [[UILabel alloc] init];
        pushtitle.frame = CGRectMake(pushimageX, 55 * px, 300*px, 48*px);
        pushtitle.text = @"关于我们";
        pushtitle.font = [UIFont systemFontOfSize:WyzFont];
        [push addSubview:pushtitle];
    }else{
        UIView * push = [[UIView alloc] init];
        push.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        [cell addSubview:push];
        
        UILabel * pushtitle = [[UILabel alloc] init];
        pushtitle.frame = CGRectMake(0, 50 * px, ScreenWidth, 72 * px);
        pushtitle.textAlignment = NSTextAlignmentCenter;
        pushtitle.textColor = [UIColor orangeColor];
        pushtitle.text = @"安全退出";
        pushtitle.font = [UIFont systemFontOfSize:56 * px];
        [push addSubview:pushtitle];
        
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        WYCModifyController * modify = [[WYCModifyController alloc] init];
        [self.navigationController pushViewController:modify animated:NO];
    }
    
    if (indexPath.row == 4) {
        WYCFmessgeController * Fmessgecontroller = [[WYCFmessgeController alloc] init];
        [self.navigationController pushViewController:Fmessgecontroller animated:NO];
        
        // 取消选中状态
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    }
    if (indexPath.row == 1) {
        WYCPaymentController * Paymenttroller = [[WYCPaymentController alloc] init];
        [self.navigationController pushViewController:Paymenttroller animated:NO];
        
        // 取消选中状态
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    }
    if (indexPath.row == 6) {
        WYCAboutMeController * aboutController = [[WYCAboutMeController alloc] init];
        [self.navigationController pushViewController:aboutController animated:NO];
    }
}
@end
