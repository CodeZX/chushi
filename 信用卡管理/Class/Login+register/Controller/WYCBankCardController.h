//
//  WYCBankCardController.h
//  初试
//
//  Created by 李胜军 on 2017/10/23.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYCBankCardController : UIViewController
/**银行卡图片*/
@property (strong , nonatomic) NSString *bankCardUrl;

/**银行id*/
@property (strong , nonatomic) NSString *bankId;


/**银行昵称*/
@property (strong , nonatomic) NSString *bankName;


/**银行卡图片*/
@property (strong , nonatomic) NSString *cardNumber;
@end
