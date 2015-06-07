//
//  FeedViewController.m
//  BabyNinja
//
//  Created by Rawan Alharbi on 6/7/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "FeedViewController.h"
#import "FeedOuncesViewController.h"
#import "BreastSideViewController.h"


@interface FeedViewController ()

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //Add sub view
    self.formula = [[FeedOuncesViewController alloc] init];
    [self.view addSubview:self.formula.view];
    self.formula.view.frame = CGRectMake(0, 100, 0, 0);   //Set the sub view position within this main view
    [self.formula.view setHidden:YES];
    
    self.breast = [[BreastSideViewController alloc] init];
    [self.view addSubview:self.breast.view];
    self.breast.view.frame = CGRectMake(0, 100, 0, 0);   //Set the sub view position within this main view
    [self.breast.view setHidden:NO];
}

- (IBAction)segmentSwitch:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    
    if (selectedSegment == 0) {
        //toggle the correct view to be visible
        [self.formula.view setHidden:YES];
        [self.breast.view setHidden:NO];
    }
    else{
        //toggle the correct view to be visible
        [self.formula.view setHidden:NO];
        [self.breast.view setHidden:YES];
    }
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
