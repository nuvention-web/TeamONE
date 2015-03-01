//
//  ReportScreenViewController.h
//  BabyNinja
//
//  Created by Sneha on 3/1/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReportScreenViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *reportNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *reportDurationLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountLAbel;
@property (weak, nonatomic) IBOutlet UILabel *insightLable;
@property (weak, nonatomic) IBOutlet UIImageView *reportIcon;
@property (weak, nonatomic) IBOutlet UIImageView *secondaryReportIcon;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;

- (IBAction)cancelButtonPressed:(id)sender;
- (IBAction)shareButtonPressed:(id)sender;

@end
