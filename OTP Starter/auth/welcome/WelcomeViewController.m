//
//  WelcomeViewController.m
//  OTP Starter
//
//  Created by James Gibbons on 15/09/2020.
//  Copyright © 2020 James Gibbons. All rights reserved.
//

#import "WelcomeViewController.h"

@interface WelcomeViewController ()

@end

@implementation WelcomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController setNavigationBarHidden:true animated:false];
}


- (void)viewWillAppear:(BOOL)animated {
    if(![self.navigationController isNavigationBarHidden]) {
        [self.navigationController setNavigationBarHidden:true animated:true];
    }
}


- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    [self.navigationController setNavigationBarHidden:false animated:false];
    
    return true;
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
