//
//  WYCStrCardCell.m
//  初试
//
//  Created by 中企互联 on 2017/10/13.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCStrCardCell.h"

@implementation WYCStrCardCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    WYCStrCardCell * cell = [tableView dequeueReusableCellWithIdentifier:[WYCStrCardCell ID]];
    if (!cell) {
        cell = [[WYCStrCardCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[WYCStrCardCell ID]];
    }
    
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setMember];
        
    }
    return self;
}
//cell控件摆放
- (void)setMember{
    //背景cell
    UIView * backView = [[UIView alloc] init];
    backView.frame = CGRectMake(0, 0, ScreenWidth, 240 * px);
    backView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:backView];
    
    //银行图标
    UIImageView * bankImageView = [[UIImageView alloc] init];
    bankImageView.frame = CGRectMake(40 * px, 40 * px, 160 * px, 160 * px);
    bankImageView.layer.cornerRadius = bankImageView.width / 2;
//    bankImageView.layer.masksToBounds = YES;
    bankImageView.image = [UIImage imageNamed:@"zhaobank"];
    [backView addSubview:bankImageView];
    
    //银行类型
    UILabel * banktypelabel = [[UILabel alloc] init];
    banktypelabel.frame = CGRectMake(CGRectGetMaxX(bankImageView.frame) + 30 * px, bankImageView.y, ScreenWidth / 2, 70 * px);
    banktypelabel.font = [UIFont systemFontOfSize:MiddleFont];
    banktypelabel.text = @"招商银行 信用卡";
    [backView addSubview:banktypelabel];
    
    
    //银行卡号
    UILabel * banknumlabel = [[UILabel alloc] init];
    banknumlabel.frame = CGRectMake(banktypelabel.x, CGRectGetMaxY(banktypelabel.frame) + 20 * px, ScreenWidth / 2, 70 * px);
    banknumlabel.textColor = WYCRGBColor(174, 174, 174);
    banknumlabel.text = @"6222 **** ***** *** 062";
    [backView addSubview:banknumlabel];
    
    
    UIButton * hideButton = [[UIButton alloc] init];
    hideButton.frame = CGRectMake(ScreenWidth - 40 * px - 80 * px, 40 * px + bankImageView.height / 3, 80 * px, 50 * px);
    [hideButton setImage:[UIImage imageNamed:@"cardhide"] forState:UIControlStateNormal];
    [backView addSubview:hideButton];
    
    
}

+(NSString *)ID{
    return @"cell";
}

@end
