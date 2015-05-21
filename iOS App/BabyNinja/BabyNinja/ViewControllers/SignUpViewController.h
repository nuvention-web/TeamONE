//
//  SignUpViewController.h
//  BabyNinja
//
//  Created by Sneha on 5/20/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;

@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSegmentControl;

- (IBAction)genderSegmentControlChanged:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *signUpButton;

- (IBAction)signUpButtonPressed:(id)sender;


@end
