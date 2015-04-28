//
//  DiaperSettingsViewController.m
//  BabyNinja
//
//  Created by Sneha on 3/3/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "DiaperSettingsViewController.h"

@interface DiaperSettingsViewController ()

@property (nonatomic, assign) int numberOfDiapers;
@property (nonatomic, assign) int minNumberOfDiapers;

@end

@implementation DiaperSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.numberOfDiapers = [self.numberOfDiapersInStock.text intValue];
    self.minNumberOfDiapers = [self.thresholdNumberOfDiapers.text intValue];
    self.numberOfDiapersInStock.delegate = self;
    self.thresholdNumberOfDiapers.delegate = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated{
    [[Utility sharedUtility] saveUserDefaultObject:[NSNumber numberWithInt:self.numberOfDiapers] forKey:DiaperCount];
    [[Utility sharedUtility] saveUserDefaultObject:[NSNumber numberWithInt:self.minNumberOfDiapers] forKey:MinDiaperCount];
}

#pragma mark UITextFieldDelegate methods
-(void)textFieldDidBeginEditing:(UITextField *)textField{
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardWillShow:)
//                                                 name:UIKeyboardWillShowNotification
//                                               object:nil];
}

- (void)keyboardWillShow:(NSNotification *)note {
    // create custom button
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    doneButton.frame = CGRectMake(0, 163, 106, 53);
    doneButton.adjustsImageWhenHighlighted = NO;
    [doneButton setTitle:@"Done" forState:UIControlStateNormal];
//    [doneButton setImage:[UIImage imageNamed:@"doneButtonNormal.png"] forState:UIControlStateNormal];
//    [doneButton setImage:[UIImage imageNamed:@"doneButtonPressed.png"] forState:UIControlStateHighlighted];
    [doneButton addTarget:self action:@selector(doneButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIView *keyboardView = [[[[[UIApplication sharedApplication] windows] lastObject] subviews] firstObject];
        [doneButton setFrame:CGRectMake(0, keyboardView.frame.size.height - 53, 106, 53)];
        [keyboardView addSubview:doneButton];
        [keyboardView bringSubviewToFront:doneButton];
        
        [UIView animateWithDuration:[[note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue]-.02
                              delay:.0
                            options:[[note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] intValue]
                         animations:^{
                             self.view.frame = CGRectOffset(self.view.frame, 0, 0);
                         } completion:nil];
    });
}

-(void)doneButtonPressed{
    [self.numberOfDiapersInStock resignFirstResponder];
    [self.thresholdNumberOfDiapers resignFirstResponder];
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
