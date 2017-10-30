//
//  WYCPhotographController.m
//  初试
//
//  Created by 李胜军 on 2017/10/19.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCPhotographController.h"
#import <AVFoundation/AVFoundation.h>
#import "ShowImageViewController.h"
@interface WYCPhotographController() <AVCaptureMetadataOutputObjectsDelegate,UIAlertViewDelegate>

{
    UIView * MaskView;   //蒙板
    CGRect rect;
}

//捕获设备
@property(nonatomic)AVCaptureDevice *device;

//AVCaptureDeviceInput 代表输入设备，他使用AVCaptureDevice 来初始化
@property(nonatomic)AVCaptureDeviceInput *input;

//当启动摄像头开始捕获输入
@property(nonatomic)AVCaptureMetadataOutput *output;

@property (nonatomic)AVCaptureStillImageOutput *ImageOutPut;

//session：由他把输入输出结合在一起，并开始启动捕获设备（摄像头）
@property(nonatomic)AVCaptureSession *session;

//图像预览层，实时显示捕获的图像
@property(nonatomic)AVCaptureVideoPreviewLayer *previewLayer;

@property (nonatomic)UIButton *PhotoButton;
@property (nonatomic)UIImageView *imageView;
@property (nonatomic)UIImage *image;

@property (nonatomic)BOOL canCa;
@end

@implementation WYCPhotographController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    WYCLog(@"=========%@",self.strType);
    
    _canCa = [self canUserCamear];
    if (_canCa) {
        [self customCamera];
        
        float bili = 53.98/85.6;
        
        
        CGFloat w = ScreenWidth-20;
        CGFloat h = w * bili;
        CGFloat x = 10;
        CGFloat y = (ScreenHeight-h)/2;
        
        rect = CGRectMake(x,y,w, h);
        
        _imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
        _imageView.hidden = YES;
        [self.view bringSubviewToFront:_imageView];
        [self.view addSubview:_imageView];
        
        
    }else{
        return;
    }
}
-(void)viewDidLayoutSubviews{
    
    if (!MaskView) {
        self.navigationItem.rightBarButtonItem.enabled = NO;
        MaskView = [[UIView alloc]initWithFrame:self.view.bounds];
        MaskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
        
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:MaskView.frame];
        [path appendPath:[[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:0] bezierPathByReversingPath]];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = path.CGPath;
        [MaskView.layer setMask:shapeLayer];
        [self.view addSubview:MaskView];
        
        
        //设置虚线边框
        UIView *view = [[UIView alloc] initWithFrame:rect];
        [self setDashedBorderWidth:1 bColor:[UIColor whiteColor] view:view];
        [MaskView addSubview:view];
        
        
        UILabel * title = [[UILabel alloc]initWithFrame:CGRectMake(0, 100,ScreenWidth , 30)];
        title.text = @"请将银行卡正面放入到方框中";
        title.textColor = [UIColor orangeColor];
        title.textAlignment = NSTextAlignmentCenter;
        [MaskView addSubview:title];
        
        _PhotoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _PhotoButton.frame = CGRectMake(40,ScreenHeight-100 , 100, 30);
        
        [_PhotoButton addTarget:self action:@selector(shutterCamera) forControlEvents:UIControlEventTouchUpInside];
        [_PhotoButton setTitle:@"拍照" forState:UIControlStateNormal];
        [_PhotoButton setBackgroundColor:[UIColor orangeColor]];
        [MaskView addSubview:_PhotoButton];
        
        
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        leftButton.frame = CGRectMake(ScreenWidth-140, ScreenHeight-100, 100, 30);
        [leftButton setTitle:@"取消" forState:UIControlStateNormal];
        leftButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [leftButton setBackgroundColor:[UIColor orangeColor]];
        [leftButton addTarget:self action:@selector(cancle) forControlEvents:UIControlEventTouchUpInside];
        [MaskView addSubview:leftButton];
        
        
        
    }
}


-(void)setDashedBorderWidth:(float)bwidth bColor:(UIColor *)color view:(UIView *)view{
    
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.bounds = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
    borderLayer.position = CGPointMake(CGRectGetMidX(view.bounds), CGRectGetMidY(view.bounds));
    
    borderLayer.path = [UIBezierPath bezierPathWithRect:borderLayer.bounds].CGPath;
    //设置圆角
    //    borderLayer.path = [UIBezierPath bezierPathWithRoundedRect:borderLayer.bounds cornerRadius:CGRectGetWidth(borderLayer.bounds)/2].CGPath;
    borderLayer.lineWidth = 2;
    //虚线边框
    borderLayer.lineDashPattern = @[@10, @10];
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    borderLayer.strokeColor = [UIColor orangeColor].CGColor;
    [view.layer addSublayer:borderLayer];
}


- (void)customCamera{
    self.view.backgroundColor = [UIColor whiteColor];
    
    //使用AVMediaTypeVideo 指明self.device代表视频，默认使用后置摄像头进行初始化
    self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    //使用设备初始化输入
    self.input = [[AVCaptureDeviceInput alloc]initWithDevice:self.device error:nil];
    
    //生成输出对象
    self.output = [[AVCaptureMetadataOutput alloc]init];
    self.ImageOutPut = [[AVCaptureStillImageOutput alloc] init];
    
    //生成会话，用来结合输入输出
    self.session = [[AVCaptureSession alloc]init];
    if ([self.session canSetSessionPreset:AVCaptureSessionPreset1280x720]) {
        
        self.session.sessionPreset = AVCaptureSessionPreset1280x720;
        
    }
    if ([self.session canAddInput:self.input]) {
        [self.session addInput:self.input];
    }
    
    if ([self.session canAddOutput:self.ImageOutPut]) {
        [self.session addOutput:self.ImageOutPut];
    }
    
    //使用self.session，初始化预览层，self.session负责驱动input进行信息的采集，layer负责把图像渲染显示
    self.previewLayer = [[AVCaptureVideoPreviewLayer alloc]initWithSession:self.session];
    self.previewLayer.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:self.previewLayer];
    
    //开始启动
    [self.session startRunning];
    if ([_device lockForConfiguration:nil]) {
        if ([_device isFlashModeSupported:AVCaptureFlashModeAuto]) {
            [_device setFlashMode:AVCaptureFlashModeAuto];
        }
        //自动白平衡
        if ([_device isWhiteBalanceModeSupported:AVCaptureWhiteBalanceModeAutoWhiteBalance]) {
            [_device setWhiteBalanceMode:AVCaptureWhiteBalanceModeAutoWhiteBalance];
        }
        [_device unlockForConfiguration];
    }
}

- (AVCaptureDevice *)cameraWithPosition:(AVCaptureDevicePosition)position{
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for ( AVCaptureDevice *device in devices )
        if ( device.position == position ) return device;
    return nil;
}

#pragma mark - 截取照片
- (void) shutterCamera
{
    AVCaptureConnection * videoConnection = [self.ImageOutPut connectionWithMediaType:AVMediaTypeVideo];
    if (!videoConnection) {
        NSLog(@"————————————————take photo failed!");
        return;
    }
    
    [self.ImageOutPut captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        if (imageDataSampleBuffer == NULL) {
            return;
        }
        NSData * imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
        self.image = [UIImage imageWithData:imageData];
        
        _imageView.hidden = NO;
        _imageView.image = self.image;
        
        
        UIGraphicsBeginImageContext(self.view.bounds.size);
        [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        img = [self subImageWithRect:rect img:img];
        
        [self dispatchMainAfter:1
                          block:^{
                              _imageView.hidden = YES;
                              
                              //拍照完成跳转查看图片页面
                              ShowImageViewController * show = [ShowImageViewController new];
                              show.strtype = self.strType;
                              show.image = img;
                              [self presentViewController:show animated:YES
                                               completion:nil];
                          }];
        
        
        
    }];
}

- (void)dispatchMainAfter:(NSTimeInterval)delay block:(void (^)())block {
    dispatch_after(
                   dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
                       block();
                   });
}



-(void)cancle{
    
    [self dismissViewControllerAnimated:NO completion:nil];
    
}
#pragma mark - 检查相机权限
- (BOOL)canUserCamear{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusDenied) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"请打开相机权限" message:@"设置-隐私-相机" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        alertView.tag = 100;
        [alertView show];
        return NO;
    }
    else{
        return YES;
    }
    return YES;
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0 && alertView.tag == 100) {
        
        NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        
        if([[UIApplication sharedApplication] canOpenURL:url]) {
            
            [[UIApplication sharedApplication] openURL:url];
            
        }
    }
}


/** 截取当前image对象rect区域内的图像 */
- (UIImage *)subImageWithRect:(CGRect)rec img:(UIImage *)image{
    
    
    CGFloat w = rec.size.width-4;
    CGFloat h = rec.size.height-6;
    CGFloat x = 12;
    CGFloat y = (ScreenHeight-h)/2+2;
    
    CGRect rt = CGRectMake(x,y,w, h);
    
    CGImageRef newImageRef = CGImageCreateWithImageInRect(image.CGImage, rt);
    
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    
    CGImageRelease(newImageRef);
    
    return newImage;
}

@end
