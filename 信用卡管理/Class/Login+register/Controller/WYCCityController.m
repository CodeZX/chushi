//
//  WYCCityController.m
//  初试
//
//  Created by 李胜军 on 2017/10/23.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCCityController.h"
#import "WYCCityModel.h"
#import <MJExtension.h>

@interface WYCCityController ()
/** 数组*/
@property (strong , nonatomic) NSMutableArray *addrray;


/** 省级模型*/
@property (strong , nonatomic) WYCCityModel *citymodel;
@end

@implementation WYCCityController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.addrray = [[NSMutableArray alloc] init];
    
    
    [self setupTableView];
   
    
}

- (void)setupTableView {
    
    WYCLog(@"============>>>>走到这里》》》》》");
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    params[@"id"] = @"0";
//    [HttpTool postWithURLString:AddressList parameters:params success:^(NSDictionary *data) {
//        if ([[data objectForKey:@"code"] intValue] == 0) {
//            NSArray * dataArray = data[@"result"];
//            for (NSDictionary * dict in dataArray) {
//                WYCCityModel * cityModel = [WYCCityModel mj_objectWithKeyValues:dict];
//                [self.addrray addObject:cityModel];
//            }
//        }else{
//            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:msgStr];
//            
//        }
//        [self.tableView reloadData];
//    } failure:^(NSError *error) {
//        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:Failed];
//    }];

}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
     return self.addrray.count;
    WYCLog(@"=======>>>%ld",self.addrray.count);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120 * px;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"123"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"123"];
    }
    WYCCityModel * model = self.addrray[indexPath.row];
    cell.textLabel.text = model.name;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = [UIFont systemFontOfSize:SmallFont];
    WYCLog(@"===============%@",model.name);
    return cell;
}




@end
