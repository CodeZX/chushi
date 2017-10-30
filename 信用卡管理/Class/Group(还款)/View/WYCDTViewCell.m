//
//  WYCDTViewCell.m
//  初试
//
//  Created by 中企互联 on 2017/10/17.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCDTViewCell.h"

@implementation WYCDTViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier HeightOfRow:(float)height
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setupFrame];
    }
    return self;
}
- (void)setupFrame{
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.frame = CGRectMake(40 * px, 40 * px, ScreenWidth / 3, 70 * px);
    self.timeLabel.text = @"09/10 12:20:06";
    self.timeLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_timeLabel];
    
    
    self.repaymentLbel = [[UILabel alloc] init];
    self.repaymentLbel.frame = CGRectMake(CGRectGetMaxX(self.timeLabel.frame), self.timeLabel.y, ScreenWidth / 3 , self.timeLabel.height);
    self.repaymentLbel.text = @"还款";
    self.repaymentLbel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_repaymentLbel];
    
}
@end
