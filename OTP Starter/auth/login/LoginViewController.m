//
//  LoginViewController.m
//  OTP Starter
//
//  Created by James Gibbons on 13/09/2020.
//  Copyright © 2020 James Gibbons. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"LOGIN";
    [UINavigationBar appearance].backIndicatorImage = [UIImage systemImageNamed:@"chevron.left"];

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
