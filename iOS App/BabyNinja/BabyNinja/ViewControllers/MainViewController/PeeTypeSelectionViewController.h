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
#import "ModelConstants.h"


@protocol peeTypeSelectionViewDelegate <NSObject>

-(void)peeTypeRecorded:(Activity*)activity;

@end

@interface PeeTypeSelectionViewController : UIViewController

@property (strong, nonatomic) id <peeTypeSelectionViewDelegate> delegate;

- (IBAction)yellowPeePressed:(id)sender;
- (IBAction)brownPeePressed:(id)sender;



@end
