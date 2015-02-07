//
//  ViewController.h
//  BabyNinja
//
//  Created by Sneha on 1/29/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALRadialMenu.h"

#import "ICSDrawerController.h"



@interface MainViewController : UIViewController<ICSDrawerControllerChild, ICSDrawerControllerPresenting, ALRadialMenuDelegate>

@property(nonatomic, weak) ICSDrawerController *drawer;

@property (strong, nonatomic) ALRadialMenu *radialMenu;
@property (weak, nonatomic) IBOutlet UIButton *poopButton;

@end


