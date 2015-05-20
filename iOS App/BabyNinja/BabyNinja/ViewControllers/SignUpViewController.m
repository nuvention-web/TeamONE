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
    self.confirmPasswordTextField.delegate = self;
    
    // Do any additional setup after loading the view from its nib.
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
        
    } else if (textField == self.confirmPasswordTextField){
        
        [self signUpButtonPressed:nil];
        
    }
    return YES;
    
}
@end
