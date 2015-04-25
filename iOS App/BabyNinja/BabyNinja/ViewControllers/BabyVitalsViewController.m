//
//  BabyVitalsViewController.m
//  BabyNinja
//
//  Created by Sneha on 4/25/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "BabyVitalsViewController.h"
#import "ICSDrawerController.h"
#import "MainViewController.h"
#import "LeftSideController.h"

@interface BabyVitalsViewController ()

@end

@implementation BabyVitalsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.babyImageView.layer.cornerRadius = 70;
    
    self.babyNameTextField.delegate = self;
    self.babyWeightTextField.delegate = self;
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
    [self presentViewController:[self addSideViewController] animated:NO completion:nil];
}

- (IBAction)babyDOBButtonPressed:(id)sender {
    
    if(self.babyDOBButton.tag == 0){
        [self showDatePicker];
        self.babyDOBButton.tag = 1;
    } else {
        [self hideDatePicker];
        self.babyDOBButton.tag = 0;
    }
}

-(void)showDatePicker{
    self.nextScreenButton.alpha = 0;
    
    [UIView animateWithDuration:0.5f
                     animations:^{
                         [self.datePicker setFrame:CGRectMake(self.datePicker.frame.origin.x,
                                                         450,
                                                         self.datePicker.frame.size.width,
                                                         self.datePicker.frame.size.height)];
                     }
                     completion:nil];
}

-(void)hideDatePicker{
    [UIView animateWithDuration:0.5f
                     animations:^{
                         [self.datePicker setFrame:CGRectMake(self.datePicker.frame.origin.x,
                                                              667,
                                                              self.datePicker.frame.size.width,
                                                              self.datePicker.frame.size.height)];
                     }
                     completion:nil];
    
    self.nextScreenButton.alpha = 1;
}

-(UIViewController*)addSideViewController{
    NSArray *colors ;
    //    colors = @[[UIColor colorWithRed:237.0f/255.0f green:195.0f/255.0f blue:0.0f/255.0f alpha:1.0f],
    //                        [UIColor colorWithRed:237.0f/255.0f green:147.0f/255.0f blue:0.0f/255.0f alpha:1.0f],
    //                        [UIColor colorWithRed:237.0f/255.0f green:9.0f/255.0f blue:0.0f/255.0f alpha:1.0f]
    //                        ];
    colors = @[[UIColor clearColor],
               [UIColor clearColor],
               [UIColor clearColor]
               ];
    
    LeftSideController *colorsVC = [[LeftSideController alloc] initWithColors:colors];
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:colorsVC];
    MainViewController *plainColorVC = [[MainViewController alloc] init];
    plainColorVC.view.backgroundColor = colors[0];
    UINavigationController *navController1 = [[UINavigationController alloc]initWithRootViewController:plainColorVC];
    navController1.navigationBar.barStyle = UIBarStyleBlackOpaque;
    navController.title = @"BABYNINJA";
    ICSDrawerController *drawer = [[ICSDrawerController alloc] initWithLeftViewController:navController centerViewController:navController1];
    return drawer;
}



#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
//    if(textField == self.babyDOBTextField){
//        [self showDatePicker];
//        return NO;
//    } else {
        return YES;
//    }
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
