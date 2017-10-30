//
//  WYCRmtCell.m
//  初试
//
//  Created by 中企互联 on 2017/10/11.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCRmtCell.h"

@implementation WYCRmtCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    WYCRmtCell * cell = [tableView dequeueReusableCellWithIdentifier:[WYCRmtCell ID]];
    //    cell.backgroundColor = [UIColor redColor];
    cell = [[WYCRmtCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[WYCRmtCell ID]];
    
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
    
    
    
        UIImageView * bankImageView = [[UIImageView alloc] init];
        bankImageView.frame  = CGRectMake(20 * px, 20 * px, ScreenWidth - 20 * px * 2, 600 * px);
        bankImageView.image = [UIImage imageNamed:@"back_red"];
        [self.contentView addSubview:bankImageView];
    
//    //灰色背景
//    CGFloat cellViewX = 0;
//    CGFloat cellViewY = 0;
//    CGFloat cellViewW = ScreenWidth;
//    UIView * cellView = [[UIView alloc] init];
//    cellView.backgroundColor = WYCRGBColor(214, 214, 214);
//
//
//
//
//    CGFloat backViewX = 20 * px;
//    CGFloat backViewY = 20 * px;
//    CGFloat backViewW =ScreenWidth -  20 * px * 2;
//
//
//    //间隙
//    CGFloat clearanceH = 40 * px;
//
//    //间隙
//    CGFloat smallclearH = 20 * px;
//
//    /** 背景*/
//    UIView * backView = [[UIView alloc] init];
//    backView.backgroundColor = [UIColor whiteColor];
//    //
//    //
//    /** 银行图标*/
//    CGFloat bankimageViewX = backViewX;
//    CGFloat bankimageViewW = 80 * px;
//
//    UIImageView * bankImageView = [[UIImageView alloc] init];
//    bankImageView.frame  = CGRectMake(bankimageViewX, bankimageViewX, 60 * px, 60 * px);
//    bankImageView.image = [UIImage imageNamed:@"zhaobank"];
//    [backView addSubview:bankImageView];
//
//    /** 银行名称*/
//    UILabel * banklabel = [[UILabel alloc] init];
//    banklabel.frame = CGRectMake(CGRectGetMaxX(bankImageView.frame) + 30 * px, bankImageView.y, 180 * px, 62 * px);
//    banklabel.text = @"招商银行";
//    banklabel.textColor = WYCRGBColor(82, 82, 82);
//    banklabel.font = [UIFont systemFontOfSize:SmallFont];
//    [backView addSubview:banklabel];
//
//
//    /** 姓名*/
//    UILabel * namelabel = [[UILabel alloc] init];
//    namelabel.frame = CGRectMake(CGRectGetMaxX(banklabel.frame) + 30 * px, bankImageView.y, 200 * px, 62 * px);
//    namelabel.text = @"刘志浩";
//    namelabel.textColor = WYCRGBColor(82, 82, 82);
//    namelabel.font = [UIFont systemFontOfSize:SmallFont];
//    [backView addSubview:namelabel];
//
//    /** 尾号*/
//    UILabel * lsnameberlabel = [[UILabel alloc] init];
//    lsnameberlabel.frame = CGRectMake(ScreenWidth - 20 * 2 * px - 240 * px, bankImageView.y, 240 * px, 62 * px);
//    lsnameberlabel.text = @"尾号 3423";
//    lsnameberlabel.textColor = WYCRGBColor(82, 82, 82);
//    lsnameberlabel.font = [UIFont systemFontOfSize:SmallFont];
//    [backView addSubview:lsnameberlabel];
//
//    ////////////////
//    //////分割线/////
//    ///////////////
//    UIView * topView = [[UIView alloc] init];
//    topView.frame = CGRectMake(0, CGRectGetMaxY(bankImageView.frame) +  clearanceH, ScreenWidth - smallclearH * 2, 1);
//    topView.backgroundColor = WYCRGBColor(214, 214, 214);
//    [backView addSubview:topView];
//
//
//    /** 账单日.天*/
//    UILabel * Statementlabel = [[UILabel alloc] init];
//    Statementlabel.frame = CGRectMake(bankImageView.x, CGRectGetMaxY(topView.frame) + clearanceH, 400 * px, 62 * px);
//    Statementlabel.text = @"12天后出账单";
//    Statementlabel.font = [UIFont systemFontOfSize:WyzFont];
//    [backView addSubview:Statementlabel];
//
//    /** 判断还款类型*/
//    UILabel * typelabel = [[UILabel alloc] init];
//    typelabel.frame = CGRectMake(ScreenWidth - 130 * px - clearanceH * 2, Statementlabel.y, 130 * px, 56 * px);
//    typelabel.text = @"未认证";
//    typelabel.backgroundColor = [UIColor redColor];
//    typelabel.layer.cornerRadius = typelabel.width * 3 * px;
//    typelabel.textColor = [UIColor whiteColor];
//    typelabel.font = [UIFont systemFontOfSize:SmallFont];
//    [backView addSubview:typelabel];
//
//
//    /** 账单日.出账单*/
//    UILabel * accountlabel = [[UILabel alloc] init];
//    accountlabel.frame = CGRectMake(bankImageView.x, CGRectGetMaxY(Statementlabel.frame)+ smallclearH, 300 * px, 62 * px);
//    accountlabel.textColor = WYCRGBColor(214, 214, 214);
//    accountlabel.text = @"09/12 出账单";
//    accountlabel.font = [UIFont systemFontOfSize:SmallFont];
//    [backView addSubview:accountlabel];
//
//    /** 还款日*/
//    UILabel * staylabel = [[UILabel alloc] init];
//    staylabel.frame = CGRectMake(ScreenWidth - 300 * px - clearanceH * 2, CGRectGetMaxY(Statementlabel.frame) + smallclearH, 260 * px, 62 * px);
//    staylabel.text = @"10/12 还款日";
//    staylabel.textColor = WYCRGBColor(214, 214, 214);
//    staylabel.font = [UIFont systemFontOfSize:SmallFont];
//    [backView addSubview:staylabel];
//
//
//    ////////////////
//    //////分割线/////
//    ///////////////
//    UIView * bommoView = [[UIView alloc] init];
//    bommoView.frame = CGRectMake(0, CGRectGetMaxY(staylabel.frame) + clearanceH, topView.width, topView.height);
//    bommoView.backgroundColor = WYCRGBColor(214, 214, 214);
//    [backView addSubview:bommoView];
//
//
//
//
//
//
//    /** 本期账单余额*/
//    UILabel * balancelabel = [[UILabel alloc] init];
//    balancelabel.frame = CGRectMake(20 * px, CGRectGetMaxY(bommoView.frame) + smallclearH, 500 * px, 62 * px);
//    balancelabel.text = @"本期账单余额：￥256.22";
//    balancelabel.textColor = WYCRGBColor(214, 214, 214);
//    balancelabel.font = [UIFont systemFontOfSize:SmallFont];
//    [backView addSubview:balancelabel];
//
//    /** 立即还款*/
//    UIButton * repaymentButton = [[UIButton alloc] init];
//    repaymentButton.frame = CGRectMake(lsnameberlabel.x, balancelabel.y, lsnameberlabel.width, 62 * px);
//    [repaymentButton setTitle:@"立即还款" forState:UIControlStateNormal];
//
//    repaymentButton.titleLabel.font = [UIFont systemFontOfSize:SmallFont];
//    [repaymentButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
//    [backView addSubview:repaymentButton];
//
//    CGFloat backViewH = smallclearH * 9 + bankImageView.height + clearanceH * 2 + Statementlabel.height + accountlabel.height;
//    //    CGFloat backViewH = 200;
//
//
//    backView.frame = CGRectMake(backViewX, backViewY, backViewW, backViewH);
//
//    cellView.frame = CGRectMake(cellViewX, cellViewY, cellViewW, backViewH + clearanceH);
//    [cellView addSubview:backView];
//
//    [self.contentView addSubview:cellView];
}

+(NSString *)ID{
    return @"cell";
}
@end
