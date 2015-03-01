//
//  ConfigurationTableViewCell.m
//  BabyNinja
//
//  Created by Sneha on 2/28/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "ConfigurationTableViewCell.h"

@implementation ConfigurationTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setFurtherConfigurationRequired:(BOOL)furtherConfigurationRequired{
    _furtherConfigurationRequired = furtherConfigurationRequired;
    
    if(furtherConfigurationRequired==YES)
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

@end
