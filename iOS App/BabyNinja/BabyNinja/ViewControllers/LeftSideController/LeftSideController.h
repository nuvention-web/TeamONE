//
//  LeftSideController.h
//  BabyNinja
//
//  Created by Sneha on 2/3/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "ICSDrawerController.h"

@interface LeftSideController : UITableViewController<ICSDrawerControllerChild, ICSDrawerControllerPresenting>

@property(nonatomic, weak) ICSDrawerController *drawer;

- (id)initWithColors:(NSArray *)colors;

@end
