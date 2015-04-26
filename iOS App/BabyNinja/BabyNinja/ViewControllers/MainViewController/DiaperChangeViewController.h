//
//  DiaperChangeViewController.h
//  BabyNinja
//
//  Created by Sneha on 3/10/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DiaperChangeProtocol <NSObject>

-(void)diaperChangeRecorded:(Diapers*)activity;

@end

@interface DiaperChangeViewController : UIViewController

@property (nonatomic, assign) id <DiaperChangeProtocol> delegate;

- (IBAction)preeButtonPressed:(id)sender;

@end
