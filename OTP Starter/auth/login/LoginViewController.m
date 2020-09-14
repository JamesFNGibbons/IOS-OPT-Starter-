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
        
    // small UI tweaks for the input dialogs.
    self.numberInput.placeholder = @"Your Number";
    [self.numberInput setKeyboardType: UIKeyboardTypeNumberPad];
    
    self.smsCodeInput.placeholder = @"6 digit SMS code";
    [self.smsCodeInput setKeyboardType: UIKeyboardTypeNumberPad];
}


- (void)viewWillAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[self view] endEditing:true];
}


- (void)keyboardWillShow:(NSNotification *)notification {
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    CGRect frame = self.view.frame;
    
    int contentKeyboardPadding = 0;
    
    // resize frame to fit keyboard within, with content padding behind keyboard
    frame.origin.y -= (keyboardSize.height + contentKeyboardPadding);
    self.view.frame = frame;
}


- (void)keyboardWillHide:(nullable NSNotification *)notification {
    CGRect frame = self.view.frame;
        
    // reset origin to default position value of 0
    frame.origin.y = 0;
    self.view.frame = frame;
}


- (BOOL) isAcceptableCharString:(NSString *)string {
    NSString *trimmedNonDecimalString = [string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    return ([trimmedNonDecimalString length] == 0);
    
}


- (BOOL) validateSMSNumber {
    NSString *number = self.numberInput.text;
    
    if([number length] > 0 && [self isAcceptableCharString:number]) {
        NSString *firstChar = [number substringWithRange:NSMakeRange(0, 1)];
        NSString *secondChar = [number substringWithRange:NSMakeRange(1, 1)];
        
        if([number length] == 11 && [firstChar isEqualToString:@"0"] && [secondChar isEqualToString:@"7"]) {
            return true;
        }
        else {
            
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"My Alert"
            message:@"This is an alert."
            preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *closeAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler: ^(UIAlertAction *action) {
                   [alert dismissViewControllerAnimated:true completion:nil];
               }];
            [alert addAction:closeAction];
            
            [self presentViewController:alert animated:true completion:nil];
            
            return false;
        }
    }
    else {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"My Alert"
        message:@"Your number does not seem to be correct. Please check it and try again"
        preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *closeAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler: ^(UIAlertAction *action) {
            
            [alert dismissViewControllerAnimated:true completion:nil];
        }];
        [alert addAction:closeAction];
        
        [self presentViewController:alert animated:true completion:nil];
        
        return false;
    }

    
    // default
    return false;
}


- (BOOL) validateSMSCode {
    NSString *code = self.smsCodeInput.text;
    if(code.length == 6) {
        
    }
    else {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"My Alert"
        message:@"This is an alert."
        preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *closeAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler: ^(UIAlertAction *action) {
            [alert dismissViewControllerAnimated:true completion:nil];
        }];
        [alert addAction:closeAction];
        
        [self presentViewController:alert animated:true completion:nil];
        
        return false;
    }
    
    // default
    return false;
}



- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    // close keyboard to prevent frame oversize
    [self.view endEditing:true];
    
    if([identifier isEqualToString:@"to-sms"] && [self validateSMSNumber]) {
        return true;
    }
//    else if(identifier == @"to-sms" && ![self validateSMSNumber]) {
//        return false;
//    }
    
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
