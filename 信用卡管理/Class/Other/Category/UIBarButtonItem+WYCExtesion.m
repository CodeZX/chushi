//
//  UIBarButtonItem+WYCExtesion.m
//  百思不得姐
//
//  Created by 周鑫 on 16/2/15.
//  Copyright © 2016年 WYC. All rights reserved.
//

#import "UIBarButtonItem+WYCExtesion.h"

@implementation UIBarButtonItem (WYCExtesion)
+(instancetype)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor colorWithRed:1.000 green:0.078 blue:0.000 alpha:1.000] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    button.frame = CGRectMake(0, 0, 50, 40);
//    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc]initWithCustomView:button];
}
+(instancetype)itemWithImage:(NSString *)image hight:(NSString *)hightImage target:(id)target action:(SEL)action
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:hightImage] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc]initWithCustomView:button];
}

+(UIBarButtonItem *)setbarButtonItemImageName:(NSString *)name target:(id)target title:(NSString *)title action:(SEL)feft
{
    UIImage* img=[UIImage imageNamed:name];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.frame =CGRectMake(0, 0, 44, 50);
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    [btn setBackgroundImage:img forState:UIControlStateNormal];
    [btn addTarget:target action:feft forControlEvents: UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}















@end
