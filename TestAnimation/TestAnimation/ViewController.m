//
//  ViewController.m
//  TestAnimation
//
//  Created by minzhe on 2019/3/18.
//  Copyright © 2019 minzhe. All rights reserved.
//

#import "ViewController.h"
#import "BaseAniViewController.h"
#import "RedrectViewController.h"
#import "SystemViewAniController.h"
#import "BezierPathViewController.h"

@interface ViewController () 

@end

@implementation ViewController




- (IBAction)baseAnAct:(id)sender {
    BaseAniViewController *baseAniViewController = [[BaseAniViewController alloc] init];
    [self presentViewController:baseAniViewController animated:YES completion:nil];
}

- (IBAction)redirectAniAct:(id)sender {
    RedrectViewController *redrectViewController = [[RedrectViewController alloc] init];
    [self presentViewController:redrectViewController animated:YES completion:nil];
}

- (IBAction)systemAni:(id)sender {
    SystemViewAniController *systemViewAniController = [[SystemViewAniController alloc] init];
    [self presentViewController:systemViewAniController animated:YES completion:nil];

}

- (IBAction)beisaierAni:(id)sender {
    BezierPathViewController *bezierPathViewController = [[BezierPathViewController alloc] init];
    [self presentViewController:bezierPathViewController animated:YES completion:nil];
}

@end
