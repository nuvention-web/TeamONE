//
//  SleepModeViewController.h
//  BabyNinja
//
//  Created by Sneha on 3/9/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BabyNinjaModels.h"
@protocol SleepActivityProtocol <NSObject>

//-(void)sleepRecorded:(BabyActivity*)activity;  //TODO: change the BabyActivity type
-(void)sleepRecorded:(Activity*)activity;  //TODO: change the BabyActivity type
@end

@interface SleepModeViewController : UIViewController

@property (nonatomic, assign) id <SleepActivityProtocol> delegate;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;

@end
