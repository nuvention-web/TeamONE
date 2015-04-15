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
    
    self.loginFBButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    self.loginFBButton.delegate = self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(profileUpdated:) name:FBSDKProfileDidChangeNotification object:nil];
    if ([FBSDKAccessToken currentAccessToken]) {
        // User is logged in, do work such as go to next view controller.
    }
}

-(void)profileUpdated:(NSNotification *) notification{
    NSLog(@"User name: %@",[FBSDKProfile currentProfile].name);
    NSLog(@"User ID: %@",[FBSDKProfile currentProfile].userID);
}

#pragma mark FBSDKLoginButtonDelegate methods

- (void)  loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                error:(NSError *)error{
    
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton{
    
}

@end
