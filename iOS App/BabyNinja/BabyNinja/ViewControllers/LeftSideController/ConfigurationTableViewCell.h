//
//  ConfigurationTableViewCell.h
//  BabyNinja
//
//  Created by Sneha on 2/28/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfigurationTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *configurationNameLabel;
@property (weak, nonatomic) IBOutlet UISwitch *configurationSwitch;
@property (nonatomic, assign) BOOL furtherConfigurationRequired;

@end
