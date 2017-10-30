//
//  WYCDTViewCell.h
//  初试
//
//  Created by 中企互联 on 2017/10/17.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYCDTViewCell : UITableViewCell
/** 还款日期*/
@property(nonatomic,strong)UILabel * timeLabel;


/** 还款类型*/
@property(nonatomic,strong)UILabel * repaymentLbel;

/** 还款金额*/
@property(nonatomic,strong)UILabel * moneyLabel;


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier  HeightOfRow:(float)height;
@end
