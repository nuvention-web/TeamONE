//
//  BreastSideViewController.m
//  BabyNinja
//
//  Created by Sneha on 4/27/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "BreastSideViewController.h"

@interface BreastSideViewController ()

@end

@implementation BreastSideViewController

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

- (IBAction)leftSelected:(id)sender {
    [self.delegate breastFeedRecorded:[Activity new]];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)rightSelected:(id)sender {
    [self.delegate breastFeedRecorded:[Activity new]];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)bothSidesSelected:(id)sender {
    [self.delegate breastFeedRecorded:[Activity new]];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
