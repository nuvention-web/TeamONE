//
//  ReminderSettingsViewController.m
//  BabyNinja
//
//  Created by Sneha on 2/28/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "ReminderSettingsViewController.h"

@interface ReminderSettingsViewController ()

@end

@implementation ReminderSettingsViewController

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
- (IBAction)poopTipsInfoPressed:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Poop Tips" message:@"This alert will monitor when your baby poops loose and will remind you to check the diaper more often, check for good hydration and to be on alert for skin rash." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles: nil];
    [alert show];
}
- (IBAction)foodReminderInfoPRessed:(id)sender {
}
- (IBAction)diaperReminderInfoPressed:(id)sender {
}



@end
