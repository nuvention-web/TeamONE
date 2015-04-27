//
//  ViewController.h
//  BabyNinja
//
//  Created by Sneha on 1/29/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALRadialMenu.h"
#import "Baby.h"
#import "ICSDrawerController.h"
#import "Activity.h"

@protocol CareTakerDelegate <NSObject>

-(void)addActivityToCurrentBaby:(Activity*)activity;

@end


@interface MainViewController : UIViewController<ICSDrawerControllerChild, ICSDrawerControllerPresenting, ALRadialMenuDelegate>
-(id)initWithCareTaker:(CareTaker*)careTaker;
@property(nonatomic, weak) ICSDrawerController *drawer;
@property (strong, nonatomic) ALRadialMenu *radialMenu;
@property (strong, nonatomic) ALRadialMenu *radialFeedMenu;
@property (weak, nonatomic) IBOutlet UIButton *poopButton;
@property (weak, nonatomic) IBOutlet UIButton *feedButton;
@property (weak, nonatomic) IBOutlet UIButton *sleepOrAwakeButton;

@property (nonatomic, assign) id<CareTakerDelegate>  delegate;
@property (nonatomic, strong) CareTaker *careTaker;




-(void)addActivityToCurrentBaby:(Activity*)activity;

@end


