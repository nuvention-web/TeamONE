//
//  LoginViewController.m
//  BabyNinja
//
//  Created by Sneha on 4/14/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "LoginViewController.h"

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if ([FBSDKAccessToken currentAccessToken]) {
        // User is logged in, do work such as go to next view controller.
    }
}

@end
