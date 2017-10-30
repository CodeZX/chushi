

//
//  WYCPickerView.m
//  信用卡管理
//
//  Created by 李胜军 on 2017/10/27.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCPickerView.h"
#import "WYCCityModel.h"
#import <MJExtension.h>

@interface WYCPickerView () <UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, strong) UIPickerView *pickerView;

/** 数组 */
@property (nonatomic,strong) NSMutableArray *dmtpArray;

@end

@implementation WYCPickerView

- (instancetype)init{
    self = [super init];
    if (self) {
        self.dmtpArray = [[NSMutableArray alloc] init];
        self.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
        self.pickerView = [[UIPickerView alloc] initWithFrame:self.bounds];
        self.pickerView.backgroundColor = [UIColor whiteColor];
        
        self.pickerView.delegate = self;
        self.pickerView.dataSource = self;
        self.pickerView.showsSelectionIndicator = YES;
        [self addSubview:_pickerView];
        [self companyClick];
    }
    return self;
}

- (void)companyClick{
    WYCLogFunc;
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    params[@"id"] = @"0";
    [HttpTool POST:AddressList params:params success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([[responseObject objectForKey:@"code"] intValue] == 0) {
            WYCLog(@"============%@",responseObject);
            NSArray * dataArray = responseObject[@"result"];
            for (NSDictionary * dict in dataArray) {
                WYCCityModel * cityModel = [WYCCityModel mj_objectWithKeyValues:dict];
                [self.dmtpArray addObject:cityModel];
            }
            
        }else{
            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:msgStr];
            
        }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
    
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return [self.dmtpArray count];
    
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    
    return 30;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    //o列从区域数组中选择
    WYCCityModel * model = self.dmtpArray[row];
    return  model.name;
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    [pickerView reloadComponent:0];
    NSInteger areaRow=[pickerView selectedRowInComponent:0];
    WYCCityModel * model = self.dmtpArray[areaRow];
    self.province = model.name;
    self.cityID = model.ID;
    
    WYCLog(@"城市ID是%@",self.cityID);
    
    
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor whiteColor]];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:SmallFont]];
    }
    // Fill the label text here
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}

@end
