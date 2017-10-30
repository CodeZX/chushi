//
//  AddressView.m
//  uipickerView
//
//  Created by wujianqiang on 15/12/28.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "AddressView.h"
#import "HttpTool.h"
#import "WYCCityModel.h"
@interface AddressView ()<UIPickerViewDataSource,UIPickerViewDelegate>



@property (nonatomic, strong) UIPickerView *pickerView;

/** 数组 */
@property (nonatomic,strong) NSMutableArray *dmtpArray;

@end

@implementation AddressView



- (instancetype)init{
    self = [super init];
    if (self) {
        self.dmtpArray = [[NSMutableArray alloc] init];
        self.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
        self.pickerView = [[UIPickerView alloc] initWithFrame:self.bounds];
        self.pickerView.backgroundColor = [UIColor clearColor];
       
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
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
//    [HttpTool POST:HTTPRequst parameters:params success:^(id responseObject) {
//        WYCLog(@"----------%@",responseObject);
//        if ([[responseObject objectForKey:@"Status"] intValue] > 0) {
//            NSDictionary * DataDic  = responseObject[@"Data"];
//            NSMutableArray * dsarray = DataDic[@"ds"];
//            for (NSDictionary * dict in dsarray) {
//                WYZDmptModel * model = [WYZDmptModel objectWithKeyValues:dict];
//                [self.dmtpArray addObject:model.DNAME];
//            }
//
//            [self.pickerView reloadAllComponents];
//            self.province = [self.dmtpArray firstObject];
//        }
//    } failure:^(NSError *error) {
//
//    }];
    
    
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
    return  [self.dmtpArray objectAtIndex:row];
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    [pickerView reloadComponent:0];
    NSInteger areaRow=[pickerView selectedRowInComponent:0];
    self.province = self.dmtpArray[areaRow];
    

}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        // Setup label properties - frame, font, colors etc
        //adjustsFontSizeToFitWidth property to YES
        pickerLabel.minimumFontSize = 8.;
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:17]];
    }
    // Fill the label text here
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}
@end
