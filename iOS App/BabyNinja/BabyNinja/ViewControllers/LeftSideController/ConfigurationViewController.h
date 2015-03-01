//
//  ConfigurationViewController.h
//  BabyNinja
//
//  Created by Sneha on 2/28/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfigurationViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
