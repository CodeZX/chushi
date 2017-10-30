//
//  WYCSeeBillController.m
//  初试
//
//  Created by 中企互联 on 2017/10/16.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCSeeBillController.h"
#import "WYCTranslationController.h"
#import "WYCHistoryController.h"
#import "WYCPlanController.h"

@interface WYCSeeBillController ()<UIScrollViewDelegate>
/** 标签栏底部的红色指示器 */
@property (nonatomic, weak) UIView  * indicatorView;
/** 底部所有的标签 */
@property (nonatomic, weak) UIView  * titlesView;


/** 底部所有的内容 */
@property (nonatomic, weak) UIScrollView  * contenView;

/** 取反 */
@property (nonatomic, weak) UIButton  * selectedButton;

@end

@implementation WYCSeeBillController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Nav
    [self setupNav];
    
    //底部还款
    [self setupbottomView];
    
    //界面
    [self setupCreat];
    
    
    //初始化子控制器
    [self setupChildVces];
    
    
    //底部的scrollview
    [self setupScrollView];
    
    
    
   
}
//底部还款
- (void)setupbottomView{
    //底部view
    UIView * bottomView = [[UIView alloc] init];
    bottomView.frame = CGRectMake(0, ScreenHeight - 64 - 160 * px, ScreenWidth, 160 * px);
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    
    //一键获取
    UIButton * ObtainButton = [[UIButton alloc] init];
    ObtainButton.titleLabel.font = [UIFont systemFontOfSize:SmallFont];
    ObtainButton.frame = CGRectMake(40 * px, 45 * px, 200 * px, 70 * px);
    [ObtainButton setTitle:@"一键获取" forState:UIControlStateNormal];
    [ObtainButton setTitleColor:WYCRGBColor(245, 207, 141) forState:UIControlStateNormal];
    [ObtainButton.layer setMasksToBounds:YES];
    [ObtainButton.layer setCornerRadius:3.0]; //设置矩圆角半径
    [ObtainButton.layer setBorderWidth:1.0];   //边框宽度
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 245/255.0, 207/255.0, 141/255.0, 1 });
    [ObtainButton.layer setBorderColor:colorref];//边框颜色
    
    [bottomView addSubview:ObtainButton];
    
    
    //标记已还金额
    UILabel * alreadylabel = [[UILabel alloc] init];
    alreadylabel.frame = CGRectMake(CGRectGetMaxX(ObtainButton.frame) + 30 * px, ObtainButton.y, 250 * px, ObtainButton.height);
    alreadylabel.text = @"标记已还金额";
    alreadylabel.font = [UIFont systemFontOfSize:SmallFont];
    [bottomView addSubview:alreadylabel];
    
    
    //分割线
    UIView * line = [[UIView alloc] init];
    line.frame = CGRectMake(CGRectGetMaxX(alreadylabel.frame) + 20 * px, alreadylabel.y, 0.5, alreadylabel.height);
    line.backgroundColor = WYCRGBColor(220, 220, 220);
    [bottomView addSubview:line];
    
    
    //标记已还清
    UILabel * payofflabel = [[UILabel alloc] init];
    payofflabel.frame = CGRectMake(CGRectGetMaxX(line.frame) + 30 * px, ObtainButton.y, 250 * px, ObtainButton.height);
    payofflabel.text = @"标记已还清";
    payofflabel.font = [UIFont systemFontOfSize:SmallFont];
    [bottomView addSubview:payofflabel];
    
    
    
    //立即还款
    UIButton * repaymentButton = [[UIButton alloc] init];
    repaymentButton.frame = CGRectMake(CGRectGetMaxX(payofflabel.frame) + 50 * px, 0, 400 * px, bottomView.height);
    repaymentButton.backgroundColor = WYCRGBColor(237, 176, 23);
    [repaymentButton setTitle:@"立即还款" forState:UIControlStateNormal];
    [repaymentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    repaymentButton.titleLabel.font = [UIFont systemFontOfSize:BigFont];
    [bottomView addSubview:repaymentButton];
}
/**
 *底部的scrollview
 */
- (void)setupScrollView
{
    //不自动调整inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIScrollView * contenView = [[UIScrollView alloc]init];
    contenView.frame = self.view.bounds;
    contenView.delegate = self;
    contenView.pagingEnabled = YES;
    
    [self.view insertSubview:contenView atIndex:0];
    contenView.contentSize = CGSizeMake(contenView.width * self.childViewControllers.count,0 );
    
    self.contenView = contenView;
    //
    //    //添加第一个控制器view
    [self scrollViewDidEndScrollingAnimation:contenView];
}


//初始化子控制器
- (void)setupChildVces{
    WYCTranslationController * Translation = [[WYCTranslationController alloc] init];
    Translation.title = @"账单明细";
    
    [self addChildViewController:Translation];
    
    WYCHistoryController * History = [[WYCHistoryController alloc] init];
    History.title = @"还款记录";
    
    [self addChildViewController:History];
    
    WYCPlanController * Plan = [[WYCPlanController alloc] init];
    Plan.title = @"智能还款计划";
    [self addChildViewController:Plan];
    
}
//界面
- (void)setupCreat{
    UIView * backView = [[UIView alloc] init];
    backView.frame = CGRectMake(0, 0, ScreenWidth, 500 * px);
    backView.backgroundColor = WYCRGBColor(230, 67, 80);
    [self.view addSubview:backView];
    
    
    //卡号
    UILabel * Numcardlabel = [[UILabel alloc] init];
    Numcardlabel.frame = CGRectMake(40 * px, 40 * px, ScreenWidth / 3 * 2, 70 * px);
    Numcardlabel.font = [UIFont systemFontOfSize:MiddleFont];
    Numcardlabel.textColor = [UIColor whiteColor];
    Numcardlabel.text = @"6222 **** **** **** 904";
    [backView addSubview:Numcardlabel];
    
    //银行类型
    UILabel * banklabel = [[UILabel alloc] init];
    banklabel.frame = CGRectMake(ScreenWidth - 250 * px - 40 * px, Numcardlabel.y, 250 * px, 70 * px);
    banklabel.font = [UIFont systemFontOfSize:MiddleFont];
    banklabel.textColor = [UIColor whiteColor];
    banklabel.text = @"6222 **** **** **** 904";
    banklabel.text = @"招商银行";
    [backView addSubview:banklabel];
    
    //出账单日
    UILabel * taybilllabel = [[UILabel alloc] init];
    taybilllabel.frame = CGRectMake(Numcardlabel.x, CGRectGetMaxY(Numcardlabel.frame) + 40 * px, Numcardlabel.width / 2, 70 * px);
    taybilllabel.font = [UIFont systemFontOfSize:WyzFont];
    taybilllabel.textColor = [UIColor whiteColor];
    taybilllabel.text = @"6222 **** **** **** 904";
    taybilllabel.text = @"6天后出账单";
    [backView addSubview:taybilllabel];
    
    
    //账单日
    UILabel *Statementlabel = [[UILabel alloc] init];
    Statementlabel.frame = CGRectMake(ScreenWidth - 40 * px - 350 * px, CGRectGetMaxY(banklabel.frame) + 40 * px, 350 * px, 70 * px);
    Statementlabel.text = @"账单日：09/22";
    Statementlabel.textColor = [UIColor whiteColor];
    Statementlabel.font = [UIFont systemFontOfSize:SmallFont];
    [backView addSubview:Statementlabel];
    
    //还款日
    UILabel *Repaymentlabel = [[UILabel alloc] init];
    Repaymentlabel.frame = CGRectMake(Statementlabel.x, CGRectGetMaxY(Statementlabel.frame) + 20 * px, 350 * px, 70 * px);
    Repaymentlabel.text = @"还款日：10/22";
    Repaymentlabel.textColor = [UIColor whiteColor];
    Repaymentlabel.font = [UIFont systemFontOfSize:SmallFont];
    [backView addSubview:Repaymentlabel];
    
    
    //免息期
    UILabel *Gracelabel = [[UILabel alloc] init];
    Gracelabel.frame = CGRectMake(Statementlabel.x, CGRectGetMaxY(Repaymentlabel.frame) + 20 * px, 350 * px, 70 * px);
    Gracelabel.text = @"免息期：20天";
    Gracelabel.textColor = [UIColor whiteColor];
    Gracelabel.font = [UIFont systemFontOfSize:SmallFont];
    [backView addSubview:Gracelabel];
    
    //总额度
    UILabel *Totallabel = [[UILabel alloc] init];
    Totallabel.frame = CGRectMake(Statementlabel.x, CGRectGetMaxY(Gracelabel.frame) + 20 * px, 350 * px, 70 * px);
    Totallabel.text = @"总额度：2.00万";
    Totallabel.textColor = [UIColor whiteColor];
    Totallabel.font = [UIFont systemFontOfSize:SmallFont];
    [backView addSubview:Totallabel];
    
    
    //推荐智能还款》》
    UIButton * IntelligenceButton = [[UIButton alloc] init];
    IntelligenceButton.frame = CGRectMake(40 * px, CGRectGetMaxY(backView.frame) + 40 * px, ScreenWidth / 2, 70 * px);
//    IntelligenceButton.backgroundColor = [UIColor redColor];
    [IntelligenceButton setTitleColor:WYCRGBColor(83, 85, 237) forState:UIControlStateNormal];
    IntelligenceButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [IntelligenceButton setTitle:@"推荐智能还款 >>" forState:UIControlStateNormal];
    [self.view addSubview:IntelligenceButton];
    
    
    UIView *titlesView = [[UIView alloc] init];
    titlesView.backgroundColor = [UIColor whiteColor];
    
    titlesView.frame = CGRectMake(0, CGRectGetMaxY(IntelligenceButton.frame) + 20 * px, self.view.frame.size.width, WYCTitilesViewH);
    [self.view addSubview:titlesView];
    self.titlesView = titlesView;
    
    // 底部的红色指示器
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = WYCRGBColor(239, 175, 0);
    indicatorView.height = 3;
    indicatorView.layer.cornerRadius = 1.5;
    //    indicatorView.tag = -1;
    indicatorView.y = titlesView.height - indicatorView.height - 10;
    self.indicatorView = indicatorView;
    
    NSArray * titlearray = @[@"账单明细",@"还款记录",@"智能还款计划"];
    CGFloat width = ScreenWidth / 3;
    CGFloat height = 100 * px;
    
    for (NSInteger i =0; i < titlearray.count; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.tag = i;
        button.height = height;
        button.width = width;
        button.x = ScreenWidth / 3 * i;
        button.y = 0;
        [button setTitle:titlearray[i] forState:UIControlStateNormal];
        [button layoutIfNeeded];//强制布局
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        [button setTitleColor:WYCRGBColor(102, 102, 102) forState:UIControlStateNormal];
        [button setTitleColor:WYCRGBColor(0, 0, 0) forState:UIControlStateDisabled];
        button.titleLabel.font = [UIFont systemFontOfSize:48*px];
        [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titlesView addSubview:button];
        
        if (i == 0) {
            [self titleClick:button];
            button.enabled = NO;
            
            self.selectedButton = button;
            
            // 让按钮内部的label根据文字内容来计算尺寸
            self.indicatorView.width = 108*px;
            self.indicatorView.centerX = button.centerX ;
        }
    }
     [titlesView addSubview:indicatorView];
    
}
- (void)titleClick:(UIButton *)button
{
    //修改按钮状态
    self.selectedButton.enabled = YES;
    button.enabled = NO;
    self.selectedButton = button;
    // 动画
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.width = 108*px;
        self.indicatorView.centerX = button.centerX;
    }];
    //滚动
    CGPoint offset = self.contenView.contentOffset;
    offset.x = button.tag * self.contenView.width;
    [self.contenView setContentOffset:offset animated:YES];
}
#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    
    //当前的索引
    //长度NSInteger * interger;
    int index = scrollView.contentOffset.x / scrollView.width;
    
    //取出子控制器
    UITableViewController * vc = self.childViewControllers[index];
    vc.tableView.x = scrollView.contentOffset.x;
    vc.tableView.y = WYCTitilesViewH;//tableview的高度默认为20
    vc.tableView.width = ScreenWidth;
    vc.tableView.height = scrollView.height;//tableview的底部
    //    //设置内边距
    //
    //    CGFloat bottom = self.tabBarController.tabBar.height;
    //    CGFloat top = CGRectGetMaxY(self.titlesView.frame);
    //    vc.tableView.contentInset = UIEdgeInsetsMake(top, 0, bottom, 0);
    //    //设置滚动条的内边距
    //    vc.tableView.scrollIndicatorInsets = vc.tableView.contentInset;
    [scrollView addSubview:vc.view];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //点击按钮
    int index = scrollView.contentOffset.x / scrollView.width;
    [self titleClick:self.titlesView.subviews[index]];
    
    
    // 添加子控制器的view
    [self scrollViewDidEndScrollingAnimation:scrollView];
}
- (void)setupNav {
    [self.navigationController.navigationBar setBarTintColor:WYCRGBColor(229, 50, 67)];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title = @"招行信用卡 0904";
    
    //右侧按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"Three" hight:@"Three" target:self action:@selector(ThreeClick)];
}

- (void)ThreeClick{
    WYCLog(@"------------>");
    
}

@end
