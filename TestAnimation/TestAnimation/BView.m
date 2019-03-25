//
//  BView.m
//  TestAnimation
//
//  Created by minzhe on 2019/3/19.
//  Copyright © 2019 minzhe. All rights reserved.
//

#import "BView.h"

@implementation BView


- (void)drawRect:(CGRect)rect {

    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineWidth = 2;
    [bezierPath moveToPoint:CGPointMake(10, 520)];
    [bezierPath addLineToPoint:CGPointMake(50, 530)];
    [bezierPath addQuadCurveToPoint:CGPointMake(180, 500) controlPoint:CGPointMake(80, 100)];
    [bezierPath addCurveToPoint:CGPointMake(375, 530) controlPoint1:CGPointMake(100, 650) controlPoint2:CGPointMake(200, 650)];
    [bezierPath addArcWithCenter:CGPointMake(300, 400) radius:50 startAngle:0 endAngle:M_PI * 3 clockwise:YES];
    [bezierPath closePath];
//
//    [bezierPath moveToPoint:CGPointMake(20, 520)];
//    [bezierPath addLineToPoint:CGPointMake(40, 520)];
    //根据CGPathRef绘制贝塞尔曲线
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathMoveToPoint(path, NULL, 10, 640);
//    CGPathAddCurveToPoint(path, NULL, 100, 700, 250, 550, 350, 650);
//    UIBezierPath *bezierPath_CGPath = [UIBezierPath bezierPathWithCGPath:path];
//    bezierPath_CGPath.lineWidth = 4;
//    //选择填充颜色
//    [[UIColor redColor] set];

    //[bezierPath_ArcCenter fill];
    //[bezierPath_CGPath fill];
    
    //选择线条颜色
    [[UIColor blackColor] set];
   
    [bezierPath stroke];
//    [bezierPath_CGPath stroke];
    
    CALayer* aniLayer = [CALayer layer];
    aniLayer.backgroundColor = [UIColor redColor].CGColor;
    aniLayer.position = CGPointMake(10, 520);
    aniLayer.bounds = CGRectMake(0, 0, 8, 8);
    aniLayer.cornerRadius = 4;
    [self.layer addSublayer:aniLayer];
    CAKeyframeAnimation* keyFrameAni = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyFrameAni.repeatCount = 1;
    keyFrameAni.path = bezierPath.CGPath;
    keyFrameAni.duration = 5;
    keyFrameAni.beginTime = CACurrentMediaTime() + 1;
    [aniLayer addAnimation:keyFrameAni forKey:@"keyFrameAnimation"];
}

@end
