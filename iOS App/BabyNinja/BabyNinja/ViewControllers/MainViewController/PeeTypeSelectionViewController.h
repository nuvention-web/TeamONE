//
//  PeeTypeSelectionViewController.h
//  
//
//  Created by EVA on 4/25/15.
//
//


#import <UIKit/UIKit.h>
#import "DiaperChangeViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <Parse/Parse.h>
#import "Activity.h"
#import "Diapers.h"
#import "Constants.h"

@interface PeeTypeSelectionViewController : UIViewController
- (IBAction)yellowPeePressed:(id)sender;
- (IBAction)brownPeePressed:(id)sender;

@end
