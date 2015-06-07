//
//  FeedViewController.h
//  BabyNinja
//
//  Created by Rawan Alharbi on 6/7/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedOuncesViewController.h"
#import "BreastSideViewController.h"

@interface FeedViewController : UIViewController

@property (strong, nonatomic)  FeedOuncesViewController *formula;
@property (strong, nonatomic)  BreastSideViewController *breast;

@end
