//
//  BabyProfileCell.m
//  BabyNinja
//
//  Created by Sneha on 2/27/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "BabyProfileCell.h"

@implementation BabyProfileCell

-(void)configureCell{
    self.profileImageView.layer.cornerRadius = 40;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:NO animated:animated];
    
    // Configure the view for the selected state
}

@end
