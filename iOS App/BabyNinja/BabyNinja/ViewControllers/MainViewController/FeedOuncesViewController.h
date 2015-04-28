//
//  FeedOuncesViewController.h
//  BabyNinja
//
//  Created by Sneha on 4/27/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BabyNinjaModels.h"

@protocol FeedOuncesDelegate <NSObject>

-(void)FeedOuncesRecorded:(Activity*)activity;

@end

@interface FeedOuncesViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
@property (nonatomic, strong) id<FeedOuncesDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (weak, nonatomic) IBOutlet UILabel *ouncesLabel;
@property (weak, nonatomic) IBOutlet UIButton *fiveOzButton;
@property (weak, nonatomic) IBOutlet UIButton *tenOzButton;
@property (weak, nonatomic) IBOutlet UIButton *FifteenOzButton;
@property (weak, nonatomic) IBOutlet UIButton *twentyOzButton;

- (IBAction)presetButtonSelected:(UIButton*)sender;
- (IBAction)okayButtonPressed:(id)sender;

@end
