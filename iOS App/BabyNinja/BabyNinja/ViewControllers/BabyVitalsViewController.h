//
//  BabyVitalsViewController.h
//  BabyNinja
//
//  Created by Sneha on 4/25/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BabyVitalsViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *babyImageView;

@property (weak, nonatomic) IBOutlet UIButton *imageEditButton;

@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSegmentControl;

@property (weak, nonatomic) IBOutlet UITextField *babyNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *babyDOBTextField;

@property (weak, nonatomic) IBOutlet UITextField *babyWeightTextField;

@property (weak, nonatomic) IBOutlet UIButton *nextScreenButton;

- (IBAction)genderSegmentControlChanged:(id)sender;

- (IBAction)imageEditButtonPressed:(id)sender;

- (IBAction)nextScreenButtonPressed:(id)sender;


@end
