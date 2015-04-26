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


@interface PoopTypeSelectionViewController : UIViewController



// BUTTON PRESSED
- (IBAction)textureLoosePoopPressed:(id)sender;
- (IBAction)textureSolidPoopPressed:(id)sender;
// COLOR PRESSED
- (IBAction)colorBrownPoopPressed:(id)sender;
- (IBAction)colorYellowPoopPressed:(id)sender;
- (IBAction)colorBlackPoopPressed:(id)sender;
- (IBAction)colorGreenPoopPressed:(id)sender;


@end
