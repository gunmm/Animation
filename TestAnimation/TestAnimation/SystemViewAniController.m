//
//  SystemViewAniController.m
//  TestAnimation
//
//  Created by minzhe on 2019/3/19.
//  Copyright © 2019 minzhe. All rights reserved.
//

#import "SystemViewAniController.h"

@interface SystemViewAniController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation SystemViewAniController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    self.imageView.image = [UIImage imageNamed:@"flowerImage"];
    [self.view addSubview:self.imageView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    //基本动画
//    [self startBasicAnimate:location];
    //阻尼动画
//    [self startSpringAnimate:location];
    
    //关键帧动画
    [self startKeyAnimate:location];
}

- (void)startBasicAnimate:(CGPoint)location {
//    [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
//         self.imageView.center = location;
//    } completion:^(BOOL finished) {
//
//    }];
    
    [UIView beginAnimations:@"MZBasicAnimation" context:nil];
    [UIView setAnimationDuration:1.5];
    _imageView.center = location;
    [UIView commitAnimations];
}

- (void)startSpringAnimate:(CGPoint)location {
    /*创建弹性动画
     damping:阻尼，范围0-1，阻尼越接近于0，弹性效果越明显
     velocity:弹性复位的速度
     */
    [UIView animateWithDuration:1.5 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.imageView.center = location;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)startKeyAnimate:(CGPoint)location {
    [UIView animateKeyframesWithDuration:5 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.5 animations:^{
            self.imageView.center = CGPointMake(80, 220);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.25 animations:^{
            self.imageView.center = CGPointMake(40, 300);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.75 relativeDuration:0.25 animations:^{
            self.imageView.center = CGPointMake(67, 400);
        }];
    } completion:^(BOOL finished) {
        
    }];
}



- (IBAction)closeBtnAct:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
