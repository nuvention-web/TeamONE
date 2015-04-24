//
//  PoopDetailViewController.h
//  BabyNinja
//
//  Created by EVA on 4/23/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiaperChangeViewController.h"
#import "Poop.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <Parse/Parse.h>
#import "JBChartView.h"
#import "JBBarChartView.h"
#import "JBLineChartView.h"


@interface PoopDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *poopCounter;
- (IBAction)poop1Pressed:(id)sender;
- (IBAction)poop2Pressed:(id)sender;
- (IBAction)poop3Pressed:(id)sender;
- (IBAction)poop4Pressed:(id)sender;

@end
