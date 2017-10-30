//意见反馈
//  WYCFmessgeController.m
//  初试
//
//  Created by 中企互联 on 2017/10/12.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCFmessgeController.h"

@interface WYCFmessgeController ()

@end

@implementation WYCFmessgeController

- (void)viewDidLoad {
    //Nav字体颜色+ 背景
    
    [self setupNav];
    
    
    //界面UI
    [self setupCreatView];
    
}
//界面UI
- (void)setupCreatView{
    
    //输入框
    UITextView * texView = [[UITextView alloc] init];
    texView.backgroundColor = [UIColor whiteColor];
    texView.frame = CGRectMake(0, 0, ScreenWidth, 600 * px);
    [self.view addSubview:texView];
    
    //图片添加
    UIImageView * imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, CGRectGetMaxY(texView.frame), 270 * px, 270 * px);
    imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:imageView];
    
    //手机号邮箱输入
    UITextField * iphoneField = [[UITextField alloc] init];
    iphoneField.frame = CGRectMake(0, CGRectGetMaxY(imageView.frame) + 30 * px, ScreenWidth, 160 * px);
    iphoneField.backgroundColor = [UIColor whiteColor];
    iphoneField.placeholder = @"手机号/邮箱（选填），方便我们联系您";
    [self.view addSubview:iphoneField];
    
    
    
    UIButton *SubmitButton = [[UIButton alloc] init];
    SubmitButton.frame = CGRectMake(40 * px, CGRectGetMaxY(iphoneField.frame) + 160 * px, ScreenWidth - 80 * px, 160 * px);
    SubmitButton.layer.cornerRadius = 5;
    SubmitButton.backgroundColor = WYCRGBColor(215, 215, 215);
    [SubmitButton setTitle:@"提交" forState:UIControlStateNormal];
    [SubmitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:SubmitButton];
    
    
    
}

//Nav字体颜色+ 背景
- (void)setupNav {
    self.navigationItem.title = @"意见反馈";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
}

@end
