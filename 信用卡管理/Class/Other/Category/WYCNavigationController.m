//
//  WYCNavigationController.m
//  TATA
//
//  Created by 周鑫 on 16/3/31.
//  Copyright © 2016年 WXR. All rights reserved.
//

#import "WYCNavigationController.h"
#import "WYCBillController.h"
#import "WYCMeController.h"
@interface WYCNavigationController ()

@end

@implementation WYCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WYCRGBColor(245, 245, 245);
    self.navigationBar.backgroundColor = [UIColor redColor];
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    self.navigationBar.translucent = NO;
    
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
      if (self.viewControllers.count > 0)
    {
        
        UIImageView *image = [[UIImageView alloc]init];
        image.frame = CGRectMake(0, 0, ScreenWidth, 64);
        
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [button setImage:[UIImage imageNamed:@"Nav_back"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"Nav_back"] forState:UIControlStateHighlighted];
        button.size = CGSizeMake(70, 30);
        //让按钮内部的所有内容左对齐
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

-(void)back
{
    [self popViewControllerAnimated:YES];
}
@end
