//
//  ShowImageViewController.h
//  photographDemo
//
//  Created by 李胜军 on 2017/10/20.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    //身份证正面
    typeidps = 0,
    
    //身份证反面
    typehidsd = 1,
    
    //手持身份证正面
    typeidhold = 2,
    
    //手持身份证反面
    typeidside = 3,
    
    //银行卡正面
    typecardhold = 4

}WYCstrType;
@interface ShowImageViewController : UIViewController

@property(strong,nonatomic)UIImage *image;


/** 类型判断*/
@property (strong , nonatomic) NSString *strtype;

@end
