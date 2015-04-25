//
//  BabyVitalsViewController.m
//  BabyNinja
//
//  Created by Sneha on 4/25/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "BabyVitalsViewController.h"

@interface BabyVitalsViewController ()

@end

@implementation BabyVitalsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)genderSegmentControlChanged:(id)sender {
}

- (IBAction)imageEditButtonPressed:(id)sender {
    
}

- (IBAction)nextScreenButtonPressed:(id)sender {
    
}

-(void)showDatePicker{
    [UIView animateWithDuration:0.5f
                     animations:^{
                         [self.datePicker setFrame:CGRectMake(self.datePicker.frame.origin.x,
                                                         0,
                                                         self.datePicker.frame.size.width,
                                                         self.datePicker.frame.size.height)];
                     }
                     completion:nil];
}

-(void)hideDatePicker{
    [UIView animateWithDuration:0.5f
                     animations:^{
                         [self.datePicker setFrame:CGRectMake(self.datePicker.frame.origin.x,
                                                              0,
                                                              self.datePicker.frame.size.width,
                                                              self.datePicker.frame.size.height)];
                     }
                     completion:nil];
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if(textField == self.babyDOBTextField){
        [self showDatePicker];
        return NO;
    } else {
        return YES;
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    return YES;
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    return YES;
    
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    
    return YES;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    return YES;
}
@end
