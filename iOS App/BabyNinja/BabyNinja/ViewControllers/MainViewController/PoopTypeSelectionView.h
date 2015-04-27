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

#import "Poop.h"


@interface PoopTypeSelectionView : UIView

@property (strong, nonatomic) Baby *dummyBaby;
@property (weak, nonatomic) IBOutlet UIButton *looseTextureButton;
@property (weak, nonatomic) IBOutlet UIButton *solidTextureButton;
@property (weak, nonatomic) IBOutlet UIButton *yellowColorButton;
@property (weak, nonatomic) IBOutlet UIButton *brownColorButton;
@property (weak, nonatomic) IBOutlet UIButton *greenColorButton;
@property (weak, nonatomic) IBOutlet UIButton *blackColorButton;

- (IBAction)textureSelected:(id)sender;

- (IBAction)colorSelected:(id)sender;



@end
