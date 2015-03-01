//
//  ReminderSettingsViewController.h
//  BabyNinja
//
//  Created by Sneha on 2/28/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReminderSettingsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISwitch *diaperReminderSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *foodReminderSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *poopTrendsReminderSwitch;

@end
