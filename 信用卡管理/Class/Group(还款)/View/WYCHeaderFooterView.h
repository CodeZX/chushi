//
//  WYCHeaderFooterView.h
//  初试
//
//  Created by 中企互联 on 2017/10/17.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol WYCHeaderFooterViewDelegate <NSObject>
- (void)reloadTableView;

@end

@interface WYCHeaderFooterView : UITableViewHeaderFooterView


@property (weak,nonatomic) id <WYCHeaderFooterViewDelegate> delegate;

/** 月份账单*/
@property(nonatomic,strong)UILabel * MonthLabel;

/** 日期*/
@property(nonatomic,strong)UILabel * TimeLabel;

/** 金额《钱》*/
@property(nonatomic,strong)UILabel * NumberLabel;

/** 账单金额《钱》*/
@property(nonatomic,strong)UILabel * MoneyLabel;

/** 闭合*/
@property(nonatomic,strong)UIButton * OpenButton;


/** 是否展开*/
@property (nonatomic, assign) BOOL isOpen;

@property(nonatomic,strong) void(^schoolhead)(BOOL);


+(instancetype)headFootViewTableView:(UITableView *)tableView section:(NSInteger)section;
@end
