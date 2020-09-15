//
//  LaunchViewController.m
//  OTP Starter
//
//  Created by James Gibbons on 15/09/2020.
//  Copyright © 2020 James Gibbons. All rights reserved.
//

#import "LaunchViewController.h"

@interface LaunchViewController ()

@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
}


- (void)viewDidAppear:(BOOL)animated {
    
    // animate and await result
    [self animateLaunch :^(bool animationCompleted) {
        [self animateViewOut:^(bool completed) {
            UIViewController *welcomeViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"preAuthNavController"];
                  [self presentViewController:welcomeViewController animated:false completion:nil];
        }];
    }];
}


- (void) animateViewOut: (void(^)(bool)) handler {
    [UIView animateWithDuration:1 animations:^{
        [self.view setAlpha:0.0f];
        
    } completion:^(BOOL finished) {
        handler(true);
    }];
}


- (void) animateLaunch: (void(^)(bool)) handler {
    NSInteger logoDefaultYPos = self.logo.frame.origin.y;
    NSInteger logoDefaultXPos = self.logo.frame.origin.x;
    
    [CATransaction begin];
    
    // animate the logo moving to the top pos
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.y";
    animation.fromValue = @(logoDefaultYPos);
    animation.toValue = @130;
    animation.duration = 1.8;
    
    // keep new pos
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = false;
    
     [CATransaction setCompletionBlock: ^{
        handler(true);
    }];
     
    [self.logo.layer addAnimation:animation forKey:@"basic"];
    [CATransaction commit];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
