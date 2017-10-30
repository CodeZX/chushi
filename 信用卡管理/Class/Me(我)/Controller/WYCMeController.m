//
//  WYCMeController.m
//  初试
//
//  Created by 中企互联 on 2017/10/10.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCMeController.h"
#import "WYCSetController.h"
#import "WYCStrCardController.h"
#import "WYCHideCardController.h"
@interface WYCMeController ()<UITableViewDelegate,UITableViewDataSource>

/**
 *列表
 */
@property (nonatomic,strong)UITableView * tableView;
@end
static NSString * ID = @"tag";
@implementation WYCMeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupSetupTableView];
    
}
- (void)setupSetupTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 9;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 600*px;
    }else if (indexPath.row == 8){
        
        return 320 * px;
    }
    return 160*px;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    if (indexPath.row == 0 || indexPath.row == 8) {
        
    }else{
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
    }
    CGFloat pushViweH = 169 * px;
    CGFloat pictureViewH = 270 * px;
    CGFloat pushimageX = 100 * px;
    //图片的长和宽
    CGFloat pushimageW = 64 * px;
    CGFloat pushimageH = 48*px;
    //间隙
    CGFloat clearH = 71 * px;
    
    if (indexPath.row == 0) {
       
        UIView * oneView = [[UIView alloc] init];
        oneView.frame = CGRectMake(0, 0, ScreenWidth, 600*px);
        
        [cell addSubview:oneView];
        
        
        UIImageView * pictureView = [[UIImageView alloc] init];
        pictureView.frame = CGRectMake(ScreenWidth / 5 * 2, 156*px, pictureViewH, pictureViewH);
        pictureView.layer.masksToBounds = YES;
        pictureView.backgroundColor = [UIColor redColor];
        pictureView.layer.cornerRadius = pictureView.width / 2;
        [oneView addSubview:pictureView];
        
        
        //127
        UILabel * namebel = [[UILabel alloc] init];
        namebel.textColor = [UIColor blackColor];
        namebel.font = [UIFont systemFontOfSize:64*px];
        namebel.textAlignment = NSTextAlignmentCenter;
        namebel.text = @"刘志浩";
        namebel.frame = CGRectMake(0, CGRectGetMaxY(pictureView.frame)+30 * px, ScreenWidth, 70*px);
        [oneView addSubview:namebel];
        
        }else if (indexPath.row == 1){
        
        UIView * push = [[UIView alloc] init];
        push.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        [cell addSubview:push];
        
        UIImageView * pushimage = [[UIImageView alloc] init];
        pushimage.image = [UIImage imageNamed:@"me_rate"];
        pushimage.frame = CGRectMake(pushimageX, 48*px , pushimageW, pushimageW);
        [push addSubview:pushimage];
        
        UILabel * pushtitle = [[UILabel alloc] init];
        pushtitle.frame = CGRectMake(CGRectGetMaxX(pushimage.frame) + clearH, 55 * px, 300*px, 48*px);
        pushtitle.text = @"我的费率";
        pushtitle.font = [UIFont systemFontOfSize:WyzFont];
        [push addSubview:pushtitle];
        
    
    }else if (indexPath.row == 2){
        
        UIView * push = [[UIView alloc] init];
        push.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        [cell addSubview:push];
        
        UIImageView * pushimage = [[UIImageView alloc] init];
        pushimage.image = [UIImage imageNamed:@"impot"];
        pushimage.frame = CGRectMake(pushimageX, pushimageH , pushimageW, pushimageW);
        [push addSubview:pushimage];
        
        UILabel * pushtitle = [[UILabel alloc] init];
        pushtitle.frame = CGRectMake(CGRectGetMaxX(pushimage.frame) + clearH, 55 * px, 300*px, 48*px);
        pushtitle.text = @"导入账单";
        pushtitle.font = [UIFont systemFontOfSize:WyzFont];
        [push addSubview:pushtitle];
        
    }else if (indexPath.row == 3){
        
        UIView * push = [[UIView alloc] init];
        push.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        //        push.backgroundColor = [UIColor blackColor];
        [cell addSubview:push];
        
        UIImageView * pushimage = [[UIImageView alloc] init];
        pushimage.image = [UIImage imageNamed:@"bill_select"];
        pushimage.frame = CGRectMake(pushimageX, 48*px , pushimageW, pushimageW);
        [push addSubview:pushimage];
        
        UILabel * pushtitle = [[UILabel alloc] init];
        pushtitle.frame = CGRectMake(CGRectGetMaxX(pushimage.frame) + clearH, 55 * px, 300*px, 48*px);
        pushtitle.text = @"账单汇总";
        pushtitle.font = [UIFont systemFontOfSize:WyzFont];
        [push addSubview:pushtitle];
        
    }else if (indexPath.row == 4){
        
        UIView * push = [[UIView alloc] init];
        push.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        //        push.backgroundColor = [UIColor blackColor];
        [cell addSubview:push];
        
        
        UIImageView * pushimage = [[UIImageView alloc] init];
        pushimage.image = [UIImage imageNamed:@"hide"];
        pushimage.frame = CGRectMake(pushimageX, pushimageH , pushimageW, pushimageW);
        [push addSubview:pushimage];
        
        UILabel * pushtitle = [[UILabel alloc] init];
        pushtitle.frame = CGRectMake(CGRectGetMaxX(pushimage.frame) + clearH, 55 * px, 300*px, 48*px);
        pushtitle.text = @"隐藏卡片管理";
        pushtitle.font = [UIFont systemFontOfSize:WyzFont];
        [push addSubview:pushtitle];
    }else if (indexPath.row == 5){
        
        UIView * push = [[UIView alloc] init];
        push.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        //        push.backgroundColor = [UIColor blackColor];
        [cell addSubview:push];
        
        
        UIImageView * pushimage = [[UIImageView alloc] init];
        pushimage.image = [UIImage imageNamed:@"halp"];
        pushimage.frame = CGRectMake(pushimageX, pushimageH , pushimageW, pushimageW);
        [push addSubview:pushimage];
        
        UILabel * pushtitle = [[UILabel alloc] init];
        pushtitle.frame = CGRectMake(CGRectGetMaxX(pushimage.frame) + clearH, 55 * px, 300*px, 48*px);
        pushtitle.text = @"帮助中心";
        pushtitle.font = [UIFont systemFontOfSize:WyzFont];
        [push addSubview:pushtitle];
        
        
        

    }
    else if (indexPath.row == 6){
        
        UIView * push = [[UIView alloc] init];
        push.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        //        push.backgroundColor = [UIColor blackColor];
        [cell addSubview:push];
        
        
        UIImageView * pushimage = [[UIImageView alloc] init];
        pushimage.image = [UIImage imageNamed:@"agent"];
        pushimage.frame = CGRectMake(pushimageX, pushimageH , pushimageW, pushimageW);
        [push addSubview:pushimage];
        
        UILabel * pushtitle = [[UILabel alloc] init];
        pushtitle.frame = CGRectMake(CGRectGetMaxX(pushimage.frame) + clearH, 55 * px, 300*px, 48*px);
        pushtitle.text = @"代理加盟";
        pushtitle.font = [UIFont systemFontOfSize:WyzFont];
        [push addSubview:pushtitle];
    }else if (indexPath.row == 7){
        
        UIView * push = [[UIView alloc] init];
        push.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        //        push.backgroundColor = [UIColor blackColor];
        [cell addSubview:push];
        
        
        UIImageView * pushimage = [[UIImageView alloc] init];
        pushimage.image = [UIImage imageNamed:@"set"];
        pushimage.frame = CGRectMake(pushimageX, pushimageH, pushimageW, pushimageW);
        [push addSubview:pushimage];
        
        UILabel * pushtitle = [[UILabel alloc] init];
        pushtitle.frame = CGRectMake(CGRectGetMaxX(pushimage.frame) + clearH, 55 * px, 300*px, 48*px);
        pushtitle.text = @"设置";
        pushtitle.font = [UIFont systemFontOfSize:WyzFont];
        [push addSubview:pushtitle];
    }else{
        UIView * push = [[UIView alloc] init];
        push.frame = CGRectMake(0, 0, ScreenWidth, pushViweH);
        [cell addSubview:push];
        
        UILabel * pushtitle = [[UILabel alloc] init];
        pushtitle.frame = CGRectMake(0, 70 * px, ScreenWidth, 72 * px);
        pushtitle.textAlignment = NSTextAlignmentCenter;
        pushtitle.textColor = [UIColor orangeColor];
        pushtitle.text = @"客服电话：400-0000-000";
        pushtitle.font = [UIFont systemFontOfSize:56 * px];
        [push addSubview:pushtitle];
        
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {
        WYCHideCardController * hideController = [[WYCHideCardController alloc] init];
        [self.navigationController pushViewController:hideController animated:NO];
    }
    if (indexPath.row == 4) {
        WYCStrCardController * StrCardController = [[WYCStrCardController alloc] init];
        [self.navigationController pushViewController:StrCardController animated:NO];
        
        // 取消选中状态
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    }
    if (indexPath.row == 7) {
        WYCSetController * setcontroller = [[WYCSetController alloc] init];
        [self.navigationController pushViewController:setcontroller animated:NO];
        
        // 取消选中状态
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    }
}
@end
