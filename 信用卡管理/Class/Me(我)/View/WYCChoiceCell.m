//
//  WYCChoiceCell.m
//  初试
//
//  Created by 中企互联 on 2017/10/13.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCChoiceCell.h"

@implementation WYCChoiceCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    WYCChoiceCell * cell = [tableView dequeueReusableCellWithIdentifier:[WYCChoiceCell ID]];
    if (!cell) {
        cell = [[WYCChoiceCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[WYCChoiceCell ID]];
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
    bankImageView.image = [UIImage imageNamed:@"choice_mail"];
    [backView addSubview:bankImageView];
    
    //银行类型
    UILabel * banktypelabel = [[UILabel alloc] init];
    banktypelabel.frame = CGRectMake(CGRectGetMaxX(bankImageView.frame) + 30 * px, bankImageView.y, ScreenWidth / 2, 70 * px);
    banktypelabel.font = [UIFont systemFontOfSize:BigMiddleFont];
    banktypelabel.text = @"12278690@qq.com";
    [backView addSubview:banktypelabel];
    
    
    //银行卡号
    UILabel * banknumlabel = [[UILabel alloc] init];
    banknumlabel.frame = CGRectMake(banktypelabel.x, CGRectGetMaxY(banktypelabel.frame) + 20 * px, ScreenWidth, 70 * px);
    banknumlabel.font = [UIFont systemFontOfSize:SmallFont];
    banknumlabel.textColor = WYCRGBColor(174, 174, 174);
    banknumlabel.text = @"上次导入：2017/09/10 18:22:13";
    [backView addSubview:banknumlabel];
    
    
    
    
}

+(NSString *)ID{
    return @"cell";
}
@end
