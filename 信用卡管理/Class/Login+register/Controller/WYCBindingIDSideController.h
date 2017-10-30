//
//  WYCBindingIDSideController.h
//  初试
//
//  Created by 李胜军 on 2017/10/23.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYCBindingIDSideController : UIViewController


/** 图片*/
@property (strong , nonatomic) NSString *faceUrl;


/** 签发机关*/
@property (strong , nonatomic) NSString *signingstr;

/** 有限期开始*/
@property (strong , nonatomic) NSString *startimestr;

/** 有限期结束*/
@property (strong , nonatomic) NSString *endtimestr;
@end
