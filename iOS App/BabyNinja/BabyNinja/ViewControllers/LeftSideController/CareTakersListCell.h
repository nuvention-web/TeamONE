//
//  CareTakersListCell.h
//  BabyNinja
//
//  Created by Sneha on 2/27/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CareTakersListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *careTaker1;
@property (weak, nonatomic) IBOutlet UIImageView *careTaker2;
@property (weak, nonatomic) IBOutlet UIImageView *careTaker3;
@property (weak, nonatomic) IBOutlet UIImageView *careTaker4;

- (IBAction)careTakerProfileSelected:(id)sender;
-(void)configureCell;
@end
