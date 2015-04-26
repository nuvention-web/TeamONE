//
//  LeftSideController.h
//  BabyNinja
//
//  Created by Sneha on 2/3/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "ICSDrawerController.h"

@interface LeftSideController : UIViewController<ICSDrawerControllerChild, ICSDrawerControllerPresenting, UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, weak) ICSDrawerController *drawer;

- (id)initWithCareTaker:(CareTaker*)careTaker;

@end
