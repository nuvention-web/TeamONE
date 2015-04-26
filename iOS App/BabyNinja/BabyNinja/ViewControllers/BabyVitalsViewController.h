//
//  BabyVitalsViewController.h
//  BabyNinja
//
//  Created by Sneha on 4/25/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Baby.h"

@interface BabyVitalsViewController : UIViewController <UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *babyImageView;

@property (weak, nonatomic) IBOutlet UIButton *imageEditButton;

@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSegmentControl;

@property (weak, nonatomic) IBOutlet UITextField *babyNameTextField;

@property (weak, nonatomic) IBOutlet UIButton *babyDOBButton;

@property (weak, nonatomic) IBOutlet UITextField *babyWeightTextField;

@property (weak, nonatomic) IBOutlet UIButton *nextScreenButton;
@property (weak, nonatomic) IBOutlet UIView *datePickerView;

- (IBAction)genderSegmentControlChanged:(id)sender;

- (IBAction)imageEditButtonPressed:(id)sender;

- (IBAction)nextScreenButtonPressed:(id)sender;

- (IBAction)babyDOBButtonPressed:(id)sender;


@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;


@end
