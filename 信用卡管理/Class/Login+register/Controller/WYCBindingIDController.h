//
//  WYCBindingIDController.h
//  初试
//
//  Created by 李胜军 on 2017/10/20.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYCBindingIDController : UIViewController
/** 地址*/
@property (strong , nonatomic) NSString *address;


/** 地址*/
@property (strong , nonatomic) NSString *birth;

/** 身份证图片*/
@property (strong , nonatomic) NSString *faceUrl;

/** 昵称*/
@property (strong , nonatomic) NSString *name;

/** 民族*/
@property (strong , nonatomic) NSString *nationality;

/** num*/
@property (strong , nonatomic) NSString *num;

/** 性别*/
@property (strong , nonatomic) NSString *sex;

/** 正反面*/
@property (strong , nonatomic) NSString *side;
@end
