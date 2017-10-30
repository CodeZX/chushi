
//
//  WYCAddMailCell.m
//  初试
//
//  Created by 中企互联 on 2017/10/13.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCAddMailCell.h"

@implementation WYCAddMailCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    WYCAddMailCell * cell = [tableView dequeueReusableCellWithIdentifier:[WYCAddMailCell ID]];
    if (!cell) {
        cell = [[WYCAddMailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[WYCAddMailCell ID]];
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
    
    //邮箱图标
    UIImageView * mailImageView = [[UIImageView alloc] init];
//    mailImageView.backgroundColor = [UIColor redColor];
    mailImageView.frame = CGRectMake(ScreenWidth / 3, 80 * px, ScreenWidth / 3, 80 * px);
    mailImageView.image = [UIImage imageNamed:@"163mail"];
    [backView addSubview:mailImageView];
    
    
}

+(NSString *)ID{
    return @"cell";
}

@end
