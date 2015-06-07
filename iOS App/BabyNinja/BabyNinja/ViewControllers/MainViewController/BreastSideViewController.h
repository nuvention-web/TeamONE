//
//  BreastSideViewController.h
//  BabyNinja
//
//  Created by Sneha on 4/27/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BabyNinjaModels.h"

@protocol BreastSideFeedDelegate <NSObject>

-(void)breastFeedRecorded:(Activity*)activity;

@end

@interface BreastSideViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *typeSegmentControl;

@property(nonatomic,strong) id<BreastSideFeedDelegate>delegate;

- (IBAction)leftSelected:(id)sender;
- (IBAction)rightSelected:(id)sender;
- (IBAction)bothSidesSelected:(id)sender;

@end
