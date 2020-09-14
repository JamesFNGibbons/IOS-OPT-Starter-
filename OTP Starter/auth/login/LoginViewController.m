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
    
    self.numberInput.placeholder = @"Your Number";

    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[self view] endEditing:true];
}


- (bool) validateSMSNumber {
    NSString *number = self.numberInput.text;
    NSLog(@([number characterAtIndex:0]));
    
    if(number.length == 9 && [number characterAtIndex:0] == @"0" && [number characterAtIndex:1] == @"7") {
        return true;
    }
    else {
        return false;
    }
}


- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if(identifier == @"to-sms" && [self validateSMSNumber]) {
        return true;
    }
    else if(identifier == @"to-sms" && ![self validateSMSNumber]) {
        return false;
    }
    
    // default
    return false;
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
