

//
//  WYCAboutMeController.m
//  初试
//
//  Created by 中企互联 on 2017/10/12.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCAboutMeController.h"

@interface WYCAboutMeController ()

@end

@implementation WYCAboutMeController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Nav字体颜色+ 背景
    
    [self setupNav];
}

//Nav字体颜色+ 背景
- (void)setupNav {
    self.navigationItem.title = @"关于我们";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
}

@end
