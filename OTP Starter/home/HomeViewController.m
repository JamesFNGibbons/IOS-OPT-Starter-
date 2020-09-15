//
//  HomeViewController.m
//  OTP Starter
//
//  Created by James Gibbons on 15/09/2020.
//  Copyright © 2020 James Gibbons. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Home";
}

- (IBAction)signoutTapEvent:(id)sender {
    NSLog(@"Here!");
}

//- (IBAction)signOutButtonTapEvent:(id)sender {
//    NSLog(@"Here!");
//    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"auth-token"];
//
//    UIViewController *welcomeViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"welcomeViewController"];
//    [self.view.window addSubview:welcomeViewController.view];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
