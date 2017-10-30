

//
//  WYCMessegeCell.m
//  初试
//
//  Created by 中企互联 on 2017/10/12.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCMessegeCell.h"

@implementation WYCMessegeCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    WYCMessegeCell * cell = [tableView dequeueReusableCellWithIdentifier:[WYCMessegeCell ID]];
    //    cell.backgroundColor = [UIColor redColor];
    cell = [[WYCMessegeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[WYCMessegeCell ID]];
    
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
    //底部View
    UIView * messegeView = [[UIView alloc] init];
    messegeView.frame = CGRectMake(0, 0, ScreenWidth, 300 * px);
    [self.contentView addSubview:messegeView];
    
    
    
    //通知label
    UILabel * notionlabel = [[UILabel alloc] init];
    notionlabel.text = @"通知";
    notionlabel.font = [UIFont systemFontOfSize:56 * px];
    notionlabel.textColor = [UIColor whiteColor];
    notionlabel.backgroundColor = [UIColor orangeColor];
    notionlabel.frame = CGRectMake(40 * px, 40 * px, 150 * px, 70 * px);
    [messegeView addSubview:notionlabel];
    
    
    //内容消息
    UILabel * titlelabel = [[UILabel alloc] init];
    titlelabel.frame = CGRectMake(CGRectGetMaxX(notionlabel.frame)+ 30 * px, notionlabel.y, messegeView.width - 30 * px - notionlabel.width - 40 * px, notionlabel.height * 2);
    titlelabel.numberOfLines = 0;
    titlelabel.text = @"在进行iOS的TableView开发时，我们有时候可能会需要单方向的禁止滑动，但是官方直接提供的方法只能禁止滑动";
    titlelabel.font = [UIFont systemFontOfSize:56 * px];
    [messegeView addSubview:titlelabel];
    
    
    //时间
    UILabel * timelabel = [[UILabel alloc] init];
    timelabel.text = @"2017.09.20";
    timelabel.font = [UIFont systemFontOfSize:40 * px];
    timelabel.textColor = WYCRGBColor(159, 159, 159);
    timelabel.frame = CGRectMake(titlelabel.x, CGRectGetMaxY(titlelabel.frame) + 40 * px , 350 * px, 50 * px);
    [messegeView addSubview:timelabel];
    
    
    //时间
    UIButton * detailedButton = [[UIButton alloc] init];
    [detailedButton setTitle:@"查看详情 >" forState:UIControlStateNormal];
    detailedButton.titleLabel.font = [UIFont systemFontOfSize:40 * px];
    [detailedButton setTitleColor:WYCRGBColor(159, 159, 159) forState:UIControlStateNormal];
    detailedButton.frame = CGRectMake(ScreenWidth - 230 * px - 40 * px, timelabel.y, 230 * px, 50 * px);
    [messegeView addSubview:detailedButton];
    
}

+(NSString *)ID{
    return @"cell";
}
@end
