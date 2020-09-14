//
//  DefaultNavigationBarController.m
//  OTP Starter
//
//  Created by James Gibbons on 14/09/2020.
//  Copyright © 2020 James Gibbons. All rights reserved.
//

#import "DefaultNavigationBarController.h"

@implementation DefaultNavigationBarController

+ (void)load {
    [[self appearance] setBackIndicatorImage:[UIImage systemImageNamed:@"chevron.left"]];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
