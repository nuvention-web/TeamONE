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
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated{
    NSUserDefaults *d = [NSUserDefaults standardUserDefaults];
    NSString *key = @"DiaperCount";
    [d setInteger:self.numberOfDiapers forKey:key];
    NSString *key1 = @"MinDiaperCount";
    [d setInteger:self.minNumberOfDiapers forKey:key1];
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
