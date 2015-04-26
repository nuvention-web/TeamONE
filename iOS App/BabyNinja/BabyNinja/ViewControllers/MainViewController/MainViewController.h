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



@interface MainViewController : UIViewController<ICSDrawerControllerChild, ICSDrawerControllerPresenting, ALRadialMenuDelegate>
-(id)initWithCareTaker:(CareTaker*)careTaker;
@property(nonatomic, weak) ICSDrawerController *drawer;
@property (nonatomic, strong) CareTaker *careTaker;
@property (strong, nonatomic) ALRadialMenu *radialMenu;
@property (strong, nonatomic) ALRadialMenu *radialFeedMenu;
@property (weak, nonatomic) IBOutlet UIButton *poopButton;
@property (weak, nonatomic) IBOutlet UIButton *feedButton;
@property (weak, nonatomic) IBOutlet UIButton *sleepOrAwakeButton;
@property (strong, nonatomic) Baby *currentBaby;

@end


