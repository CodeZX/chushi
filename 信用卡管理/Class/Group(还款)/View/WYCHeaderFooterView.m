//
//  WYCHeaderFooterView.m
//  初试
//
//  Created by 中企互联 on 2017/10/17.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCHeaderFooterView.h"

@implementation WYCHeaderFooterView

+(instancetype)headFootViewTableView:(UITableView *)tableView section:(NSInteger)section
{
    static NSString * Head = @"h";
    WYCHeaderFooterView * headerFooterView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:Head];
    if (headerFooterView == nil)
    {
        headerFooterView = [[WYCHeaderFooterView alloc] initWithReuseIdentifier:Head withSection:section];;
    }
    
    return headerFooterView;
    
}

-(id)initWithReuseIdentifier:(NSString *)reuseIdentifier withSection:(NSInteger)section
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier])
    {
        self.backgroundColor = [UIColor redColor];
//        [self setupItems];
        
        UIView * backView = [[UIView alloc] init];
        backView.frame = CGRectMake(0, 0, ScreenWidth, 200 * px);
        backView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:backView];
        //九月账单
        _MonthLabel = [[UILabel alloc] init];
        _MonthLabel.frame = CGRectMake(40 * px, 40 * px, 300 * px, 70 * px);
        _MonthLabel.text = @"九月账单";
        _MonthLabel.font = [UIFont systemFontOfSize:BigMiddleFont];
        [backView addSubview:_MonthLabel];
        
        
        //时间日期
        _TimeLabel = [[UILabel alloc] init];
        _TimeLabel.frame = CGRectMake(_MonthLabel.x, CGRectGetMaxY(_MonthLabel.frame) + 20 * px, _MonthLabel.width, 40 * px);
        _TimeLabel.font = [UIFont systemFontOfSize:SmallFont];
        _TimeLabel.textColor = WYCRGBColor(163, 163, 163);
        _TimeLabel.text = @"2017/08/13";
        [backView addSubview:_TimeLabel];
        
        
        //金额
        _MoneyLabel = [[UILabel alloc] init];
        _MoneyLabel.frame = CGRectMake(ScreenWidth - 80 * px - _MonthLabel.width - 80 * px, _MonthLabel.y, _MonthLabel.width, _MonthLabel.height);
        _MoneyLabel.text = @"300.00";
        _MoneyLabel.backgroundColor = [UIColor redColor];
        _MoneyLabel.font = [UIFont systemFontOfSize:BigMiddleFont];
        [backView addSubview:_MoneyLabel];
        
        //金额账单
        _NumberLabel = [[UILabel alloc] init];
        _NumberLabel.frame = CGRectMake(_MoneyLabel.x, CGRectGetMaxY(_MoneyLabel.frame) + 20 * px, _MonthLabel.width, _MonthLabel.height);
        _NumberLabel.font = [UIFont systemFontOfSize:WyzFont];
        _NumberLabel.text = @"账单金额";
        _NumberLabel.textColor = WYCRGBColor(163, 163, 163);
        [backView addSubview:_NumberLabel];
        
        //闭合
        _OpenButton = [[UIButton alloc] init];
        [_OpenButton setImage:[UIImage imageNamed:@"Stop"] forState:UIControlStateNormal];
        _OpenButton.frame = CGRectMake(CGRectGetMaxX(_NumberLabel.frame), _MoneyLabel.y, 90 * px, 90 * px);
        //    _OpenButton.backgroundColor = [UIColor redColor];
        [_OpenButton addTarget:self action:@selector(openClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_OpenButton];
    }
    return self;
}

- (void)openClick{
    
    self.OpenButton.selected = !self.OpenButton.selected;
    if ([self.delegate respondsToSelector:@selector(reloadTableView)]) {
        [self.delegate reloadTableView];
    }
    
}-(void)layoutSubviews
{
    [super layoutSubviews];
}

///**
// *  当一个控件被添加到父控件中就会调用
// */
//-(void)didMoveToSuperview
//{
//    if (self.OpenButton)
//    {
//        _OpenButton.imageView.transform = CGAffineTransformMakeRotation(M_PI_4);
//
//    }else{
//        _OpenButton.imageView.transform = CGAffineTransformMakeRotation(0);
//
//    }
//}
@end
