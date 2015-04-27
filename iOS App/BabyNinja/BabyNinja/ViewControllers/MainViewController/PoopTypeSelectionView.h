//
//  PoopTypeSelectionViewController.h
//  BabyNinja
//
//  Created by Sneha on 4/23/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiaperChangeViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <Parse/Parse.h>
#import "Activity.h"
#import "Diapers.h"
#import "ModelConstants.h"
#import "MainViewController.h"

#import "Poop.h"


@interface PoopTypeSelectionView : UIViewController


@property (strong, nonatomic) Baby *dummyBaby;
@property (strong, nonatomic) IBOutlet UIButton *looseTextureButton;
@property (strong, nonatomic) IBOutlet UIButton *solidTextureButton;
@property (strong, nonatomic) IBOutlet UIButton *yellowColorButton;
@property (strong, nonatomic) IBOutlet UIButton *brownColorButton;
@property (strong, nonatomic) IBOutlet UIButton *greenColorButton;
@property (strong, nonatomic) IBOutlet UIButton *blackColorButton;
@property (strong, nonatomic) IBOutlet UIButton *okayButton;

- (IBAction)textureSelected:(id)sender;

- (IBAction)colorSelected:(id)sender;

- (IBAction)okayButtonPressed:(id)sender;


@end
