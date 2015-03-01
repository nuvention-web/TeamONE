//
//  MilkSettingsViewController.h
//  BabyNinja
//
//  Created by Sneha on 2/28/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MilkSettingsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *breastFeedSwitch;
@property (weak, nonatomic) IBOutlet UIPickerView *ouncesOfBottledMilk;
@property (weak, nonatomic) IBOutlet UIView *ouncesView;

@end
