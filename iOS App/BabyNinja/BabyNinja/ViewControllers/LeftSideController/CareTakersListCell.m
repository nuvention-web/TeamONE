//
//  CareTakersListCell.m
//  BabyNinja
//
//  Created by Sneha on 2/27/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "CareTakersListCell.h"

@implementation CareTakersListCell

- (void)awakeFromNib {
    // Initialization code
    [self configureCell];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:NO animated:animated];
    
    // Configure the view for the selected state
}

-(void)configureCell{
    
    self.careTaker1.layer.cornerRadius = 26;
    self.careTaker2.layer.cornerRadius = 26;
    self.careTaker3.layer.cornerRadius = 26;
    self.careTaker4.layer.cornerRadius = 26;
    self.careTaker1.clipsToBounds = YES;
    self.careTaker2.clipsToBounds = YES;
    self.careTaker3.clipsToBounds = YES;
    self.careTaker4.clipsToBounds = YES;
    
}

- (IBAction)careTakerProfileSelected:(id)sender {
    
}

@end
