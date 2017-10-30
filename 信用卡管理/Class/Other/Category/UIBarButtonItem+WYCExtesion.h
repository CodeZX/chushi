//
//  UIBarButtonItem+WYCExtesion.h
//  百思不得姐
//
//  Created by 周鑫 on 16/2/15.
//  Copyright © 2016年 WYC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (WYCExtesion)
+(instancetype)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
+(instancetype)itemWithImage:(NSString *)image hight:(NSString *)hightImage target:(id)target action:(SEL)action;
+(UIBarButtonItem *)setbarButtonItemImageName:(NSString *)name target:(id)target title:(NSString *)title action:(SEL)feft;
@end
