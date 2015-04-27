//
//  DiaperChangeViewController.h
//  BabyNinja
//
//  Created by Sneha on 3/10/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PoopTypeSelectionView.h"
#import "Activity.h"

@protocol DiaperChangeProtocol <NSObject>

-(void)diaperChangeRecorded:(Activity*)activity;

@end

@interface DiaperChangeViewController : UIViewController

@property (nonatomic, assign) id <DiaperChangeProtocol> delegate;

- (IBAction)peeButtonPressed:(id)sender;

//@property (nonatomic, strong) PoopTypeSelectionView *poopTypeView;

@end
