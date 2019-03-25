//
//  BaseAniViewController.m
//  TestAnimation
//
//  Created by minzhe on 2019/3/19.
//  Copyright © 2019 minzhe. All rights reserved.
//

#import "BaseAniViewController.h"

@interface BaseAniViewController ()<CAAnimationDelegate>

@property (nonatomic, strong) CALayer *layer;

@end

@implementation BaseAniViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _layer = [[CALayer alloc] init];
    _layer.bounds = CGRectMake(0, 0, 20, 20);
    _layer.position = CGPointMake(50, 150);
    _layer.contents = (id)[UIImage imageNamed:@"flowerImage"].CGImage;
    [self.view.layer addSublayer:_layer];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint location = [touch locationInView:self.view];
    
    
    CAAnimation *animation = [self.layer animationForKey:@"MZBasicAnimation_Rotation"];
    if (animation) {
        if (self.layer.speed == 0) {
            [self animationResume];
        } else {
            return;
        }
    } else {
        [self rotationAnimation];
    }
    
    [self translatonAnimation:location];
}

- (void)animationPause {
    CFTimeInterval interval = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    self.layer.timeOffset = interval;
    self.layer.speed = 0;
}

- (void)animationResume {
    CFTimeInterval beginTime = CACurrentMediaTime() - self.layer.timeOffset;
    //设置偏移量
    self.layer.timeOffset = 0;
    //设置开始时间
    self.layer.beginTime = beginTime;
    //设置动画速度，开始运动
    self.layer.speed = 1.0;
    
}

//平移动画
- (void)translatonAnimation:(CGPoint)location {
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    basicAnimation.fromValue = [NSValue valueWithCGPoint:_layer.position];
    
    basicAnimation.toValue = [NSValue valueWithCGPoint:location];
    basicAnimation.duration = 1;
    basicAnimation.delegate = self;
    
    [basicAnimation setValue:[NSValue valueWithCGPoint:location] forKey:@"MZBasicAnimationLocation"];
    [_layer addAnimation:basicAnimation forKey:@"MZBasicAnimationLocation"];
}

//旋转动画
- (void)rotationAnimation {
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    basicAnimation.toValue = [NSNumber numberWithFloat:M_PI*2   ];
    basicAnimation.duration = 1;
    basicAnimation.autoreverses = YES;
    basicAnimation.repeatCount = INFINITY;
    basicAnimation.removedOnCompletion = NO;
    
    
    [_layer addAnimation:basicAnimation forKey:@"MZBasicAnimation_Rotation"];
    
}

#pragma mark ---CAAnimationDelegate

- (void)animationDidStart:(CAAnimation *)anim {
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    _layer.position = [[anim valueForKey:@"MZBasicAnimationLocation"] CGPointValue];
    [CATransaction commit];
    
    [self animationPause];
    
}


- (IBAction)closeAct:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
