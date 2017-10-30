//
//  WYCCityController.h
//  初试
//
//  Created by 李胜军 on 2017/10/23.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYCBankCardController.h"

@protocol WYCCityListdelegete<NSObject>
- (void)ViewControllerBsendValue:(NSString *)value;

@end

@interface WYCCityController : UITableViewController
//委托代理人，为了避免造成循环引用，代理一般需使用弱引用
@property(weak,nonatomic) id<WYCCityListdelegete> delegate;


/** 控制器*/
@property (strong , nonatomic) WYCBankCardController *info;
@end
