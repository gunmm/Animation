//
//  ViewController.m
//  TestMas
//
//  Created by minzhe on 2019/3/14.
//  Copyright © 2019 minzhe. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>

static CGFloat num = 200;

@interface ViewController ()

@property (nonatomic, strong) UIView *view4;
@property (nonatomic, strong) UIView *view5;
@property (nonatomic, strong) CADisplayLink *link;

@property (nonatomic, strong) CAShapeLayer *maskLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
#pragma mark --------Masonry
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectZero];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];

    UIView *view2 = [[UIView alloc] initWithFrame:CGRectZero];
    view2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view2];

    UIView *view3 = [[UIView alloc] initWithFrame:CGRectZero];
    view3.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view3];
    
    view1.hidden = YES;
    view2.hidden = YES;
    view3.hidden = YES;


    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
        make.right.equalTo(self.view.mas_right);

    }];

    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view1.mas_top).offset(50);
        make.left.equalTo(view1.mas_left);
        make.right.equalTo(view1.mas_right);
        make.height.mas_equalTo(200);
    }];


    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(view1.mas_bottom).offset(-50);
        make.left.equalTo(view1.mas_left);
        make.right.equalTo(view1.mas_right);
        make.height.equalTo(view2.mas_height);
    }];
    
    
#pragma mark --------animate

    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view4.backgroundColor = [UIColor redColor];
    [self.view addSubview:view4];
    view4.hidden = YES;
    view4.center = self.view.center;
    
    self.view4 = view4;
    
    
#pragma mark --------calayer mask
    
    UIView *view51 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    view51.backgroundColor = [UIColor greenColor];
    view51.center = self.view.center;
    [self.view addSubview:view51];
    
    UIView *view5 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    view5.backgroundColor = [UIColor redColor];
    view5.center = self.view.center;
    self.view5 = view5;
    [self.view addSubview:view5];
   
    
    
    //创建一个路径
    UIBezierPath *apath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(0.0f, 0.0f)
                                                         radius:50.0f
                                                     startAngle:0
                                                       endAngle:2 * M_PI
                                                      clockwise:YES];
    //创建maskLayer
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.bounds = CGRectMake(0, 0, 200, 200);

    maskLayer.path = apath.CGPath;
    maskLayer.fillColor = [UIColor blueColor].CGColor;
    maskLayer.fillRule = kCAFillRuleEvenOdd;
    
    maskLayer.opacity = 1.0f;
//    maskLayer.position = CGPointMake(100.0f, 100.0f);
    
    //设置mask
    self.view5.layer.mask = maskLayer;
    
    self.maskLayer = maskLayer;
    
    
    
//    maskLayer.anchorPoint = CGPointMake(1, 1);
    maskLayer.position = CGPointMake(100.0f, 100.0f);
//    maskLayer.bounds = CGRectMake(0, 0, 200, 200);
    NSLog(@"");
   

    //添加计时器
//    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(action)];
//    [self.link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
}

- (IBAction)threeSecondAnmi:(id)sender {
    [UIView animateWithDuration:3 animations:^{
        self.view4.bounds = CGRectMake(0, 0, 300, 300);
    } completion:^(BOOL finished) {
        NSLog(@"三秒结束");
    }];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:1 animations:^{
                self.view4.bounds = CGRectMake(0, 0, 100, 100);
            } completion:^(BOOL finished) {
                NSLog(@"1秒结束");
                
            }];
            
        });
    });
    
    
}

- (IBAction)oneSecondAnmi:(id)sender {
    
    NSLog(@"2--------maskLayer.maskLayer.bounds:   %@", [NSValue valueWithCGRect:self.maskLayer.bounds]);
    NSLog(@"2--------maskLayer.maskLayer.position:   %@", [NSValue valueWithCGPoint:self.maskLayer.position]);
    NSLog(@"2--------maskLayer.maskLayer.anchorPoint:   %@", [NSValue valueWithCGPoint:self.maskLayer.anchorPoint]);
    NSLog(@"2--------maskLayer.maskLayer.frame:   %@", [NSValue valueWithCGRect:self.maskLayer.frame]);
    self.maskLayer.anchorPoint = CGPointMake(1, 1);
    
    NSLog(@"3--------maskLayer.maskLayer.bounds:   %@", [NSValue valueWithCGRect:self.maskLayer.bounds]);
    NSLog(@"3--------maskLayer.maskLayer.position:   %@", [NSValue valueWithCGPoint:self.maskLayer.position]);
    NSLog(@"3--------maskLayer.maskLayer.anchorPoint:   %@", [NSValue valueWithCGPoint:self.maskLayer.anchorPoint]);
    NSLog(@"3--------maskLayer.maskLayer.frame:   %@", [NSValue valueWithCGRect:self.maskLayer.frame]);
    return;
    num = 200;
    self.maskLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, num, num)].CGPath;
    
    
    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(action)];
    [self.link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}


- (void)action {
    
    num = num - 1;
    self.maskLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:num/2 startAngle:0 endAngle:2 * M_PI clockwise:YES].CGPath;
    
    if (num == 50) {
        [self.link invalidate];
    }
    
    
    
    
}

@end
