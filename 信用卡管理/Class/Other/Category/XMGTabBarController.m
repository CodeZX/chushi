//
//  XMGTabBarController.m
//  01-百思不得姐
//
//  Created by xiaomage on 15/7/22.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XMGTabBarController.h"
#import "WYCNavigationController.h"
#import "WYCMeController.h"
#import "WYCRmtController.h"
#import "WYCBillController.h"

@implementation XMGTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [UINavigationBar appearance];
    
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = WYCRGBColor(239, 177, 22);
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    
   
    [self setupChildVc:[[WYCBillController alloc] init] title:@"账单" image:@"zhangdan" selectedImage:@"zhangdan_select"];
    
    [self setupChildVc:[[WYCRmtController alloc] init] title:@"还款" image:@"huankuan" selectedImage:@"huankuan_select"];
    
   [self setupChildVc:[[WYCMeController alloc] init] title:@"我的" image:@"me" selectedImage:@"Me_select"];
       
    
    
    
    
}

/**
 * 初始化子控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置文字和图片
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];

    // 包装一个导航控制器, 添加导航控制器为tabbarcontroller的子控制器
    WYCNavigationController *nav = [[WYCNavigationController alloc] initWithRootViewController:vc];
   nav.navigationBar.barTintColor = [UIColor whiteColor];

    [self addChildViewController:nav];
}
@end
