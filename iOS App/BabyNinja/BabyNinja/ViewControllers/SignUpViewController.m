//
//  SignUpViewController.m
//  BabyNinja
//
//  Created by Sneha on 5/20/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.emailTextField.delegate = self;
    self.passwordTextField.delegate = self;
    //self.confirmPasswordTextField.delegate = self;
    
    
    
    [self.signUpView setBackgroundColor:[UIColor whiteColor]];
    [self.signUpView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]]];
    
    
    // Remove text shadow
    CALayer *layer = self.signUpView.usernameField.layer;
    layer.shadowOpacity = 0.0f;
    layer = self.signUpView.passwordField.layer;
    layer.shadowOpacity = 0.0f;
    layer = self.signUpView.emailField.layer;
    layer.shadowOpacity = 0.0f;
    layer = self.signUpView.additionalField.layer;
    layer.shadowOpacity = 0.0f;
    
    // Set text color
    [self.signUpView.usernameField setTextColor:[UIColor colorWithRed:135.0f/255.0f green:118.0f/255.0f blue:92.0f/255.0f alpha:1.0]];
    [self.signUpView.passwordField setTextColor:[UIColor colorWithRed:135.0f/255.0f green:118.0f/255.0f blue:92.0f/255.0f alpha:1.0]];
//    self.signUpView.additionalField.hidden = YES;
//    [self.signUpView.usernameField setPlaceholder:@"Email"];
    self.signUpView.emailAsUsername = YES;
    [self.signUpView.additionalField setHidden:YES];
    // Do any additional setup after loading the view from its nib.
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    // Move all fields down on smaller screen sizes
    float yOffset = [UIScreen mainScreen].bounds.size.height <= 480.0f ? 30.0f : 0.0f;
    
    CGRect fieldFrame = self.signUpView.usernameField.frame;
    
    [self.signUpView.dismissButton setFrame:CGRectMake(10.0f, 10.0f, 87.5f, 45.5f)];
    [self.signUpView.logo setFrame:CGRectMake(66.5f, 70.0f, 187.0f, 58.5f)];
    [self.signUpView.signUpButton setFrame:CGRectMake(35.0f, 385.0f, 250.0f, 40.0f)];

    
    [self.signUpView.usernameField setFrame:CGRectMake(fieldFrame.origin.x + 5.0f,
                                                       fieldFrame.origin.y + yOffset,
                                                       fieldFrame.size.width - 10.0f,
                                                       fieldFrame.size.height)];
    yOffset += fieldFrame.size.height;
    
    [self.signUpView.passwordField setFrame:CGRectMake(fieldFrame.origin.x + 5.0f,
                                                       fieldFrame.origin.y + yOffset,
                                                       fieldFrame.size.width - 10.0f,
                                                       fieldFrame.size.height)];
    yOffset += fieldFrame.size.height;
    
    [self.signUpView.emailField setFrame:CGRectMake(fieldFrame.origin.x + 5.0f,
                                                    fieldFrame.origin.y + yOffset,
                                                    fieldFrame.size.width - 10.0f,
                                                    fieldFrame.size.height)];
    yOffset += fieldFrame.size.height;
    
    [self.signUpView.additionalField setFrame:CGRectMake(fieldFrame.origin.x + 5.0f,
                                                         fieldFrame.origin.y + yOffset,
                                                         fieldFrame.size.width - 10.0f,
                                                         fieldFrame.size.height)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)signUpButtonPressed:(id)sender {
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if(textField== self.emailTextField){
        [self.passwordTextField becomeFirstResponder];
        
    }else if (textField == self.passwordTextField){
        [self.confirmPasswordTextField becomeFirstResponder];
        
//    } else if (textField == self.confirmPasswordTextField){
//        [textField resignFirstResponder];
//        [self signUpButtonPressed:nil];
//        
    }
    return YES;
    
}
- (IBAction)genderSegmentControlChanged:(id)sender {
}
@end
