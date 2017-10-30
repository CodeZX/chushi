//
//  WYCMSdetailedController.m
//  初试
//
//  Created by 中企互联 on 2017/10/12.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCMSdetailedController.h"

@interface WYCMSdetailedController ()

@end

@implementation WYCMSdetailedController

- (void)viewDidLoad {
    [super viewDidLoad];
    //NAV按钮及颜色
    [self setupNavButton];
    
    
    //界面布局
    [self setupdetaied];
}

//webView应该
- (void)setupdetaied{
    
    
    //提示
    UILabel * messege = [[UILabel alloc] init];
    messege.frame = CGRectMake(40 * px, 40 * px, ScreenWidth - 80 * px, 100);
    messege.font = [UIFont systemFontOfSize:BigMiddleFont];
    messege.numberOfLines = 0;
    messege.text = @"如今人工智能已不单单是发表学术论文、刷新正确率的竞赛，抑或全民参与的新闻事件，它早在为各行各业的先行者们创造着实实在在的利润和商业价值。而且，随着算法改进、硬件升级、架构优化，应用人工智能技术带来的收益还会越来越高";
    [self.view addSubview:messege];
    
}
//Nav按钮及颜色
- (void)setupNavButton{
    self.navigationItem.title = @"消息详情";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
}

@end
