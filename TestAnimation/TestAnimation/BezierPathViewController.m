//
//  BezierPathViewController.m
//  TestAnimation
//
//  Created by minzhe on 2019/3/19.
//  Copyright © 2019 minzhe. All rights reserved.
//

#import "BezierPathViewController.h"
#import "BView.h"

@interface BezierPathViewController ()

@end

@implementation BezierPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

//
//    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
//    bezierPath.lineWidth = 2;
//    [bezierPath moveToPoint:CGPointMake(10, 520)];
//    bezierPath addLineToPoint:CGPointMake(<#CGFloat x#>, <#CGFloat y#>)
    
    BView *bview = [[BView alloc] initWithFrame:CGRectMake(0, 50, 375, 700)];
    bview.backgroundColor = [UIColor grayColor];
    [self.view addSubview:bview];
    
    
    
  
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    
    CALayer *aniLayer = [CALayer layer];
    aniLayer.backgroundColor = [UIColor redColor].CGColor;
    aniLayer.position = CGPointMake(10, 520);
    aniLayer.bounds = CGRectMake(0, 0, 20, 20);
//    aniLayer.cornerRadius = 4;
    [self.view.layer addSublayer:aniLayer];
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[[self keyFrameAni], [self keyFrameAni]];
    groupAnimation.duration = 5;
    [aniLayer addAnimation:groupAnimation forKey:@"keyFrameAnimation"];
    
}

- (CAKeyframeAnimation *)keyFrameAni {
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineWidth = 2;
    [bezierPath moveToPoint:CGPointMake(10, 520)];
    [bezierPath addLineToPoint:CGPointMake(50, 530)];
//    [bezierPath addQuadCurveToPoint:CGPointMake(180, 500) controlPoint:CGPointMake(80, 100)];
//    [bezierPath addCurveToPoint:CGPointMake(375, 530) controlPoint1:CGPointMake(100, 650) controlPoint2:CGPointMake(200, 650)];
//    [bezierPath addArcWithCenter:CGPointMake(300, 400) radius:50 startAngle:0 endAngle:M_PI * 3 clockwise:YES];
//    [bezierPath closePath];

    CAKeyframeAnimation *keyFrameAni = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyFrameAni.repeatCount = 1;
    keyFrameAni.path = bezierPath.CGPath;
    keyFrameAni.duration = 5;
    keyFrameAni.beginTime = CACurrentMediaTime() + 1;

    return keyFrameAni;
    
//    //1.实例化一个关键帧动画

}

//旋转动画
- (CAKeyframeAnimation *)rotationAnimation {
    
    CAKeyframeAnimation *doudong = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    //2.设置动画的属性
    doudong.duration = .15;
    
    
    //旋转的角度
    CGFloat angle = M_PI/10;
    
    //设置values数组
    doudong.values = @[@(angle),@(-angle),@(angle)];
    
    //设置重复次数
    doudong.repeatCount = HUGE_VALF;
    
    return doudong;
}



- (IBAction)closeBtnAct:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
