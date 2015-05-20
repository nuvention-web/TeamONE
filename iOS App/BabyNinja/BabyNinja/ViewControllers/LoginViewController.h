//
//  LoginViewController.h
//  BabyNinja
//
//  Created by Sneha on 4/14/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>


@interface LoginViewController : UIViewController<FBSDKLoginButtonDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginFBButton;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UIButton *signInButton;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;

- (IBAction)signInButtonPressed:(id)sender;

- (IBAction)signUpButtonPressed:(id)sender;

- (IBAction)logoutButtonPressed:(id)sender;

@end
