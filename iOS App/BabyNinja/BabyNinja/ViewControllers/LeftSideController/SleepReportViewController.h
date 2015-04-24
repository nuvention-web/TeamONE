//
//  SleepReportViewController.h
//  BabyNinja
//
//  Created by Sneha on 3/10/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JBChartTooltipView.h"
#import "JBChartView.h"

@interface SleepReportViewController : UIViewController

@property (nonatomic, strong, readonly) JBChartTooltipView *tooltipView;
@property (nonatomic, assign) BOOL tooltipVisible;

@property (weak, nonatomic) IBOutlet UILabel *header;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;


// Settres
- (void)setTooltipVisible:(BOOL)tooltipVisible animated:(BOOL)animated atTouchPoint:(CGPoint)touchPoint;
- (void)setTooltipVisible:(BOOL)tooltipVisible animated:(BOOL)animated;

// Getters
- (JBChartView *)chartView; // subclasses to return chart instance for tooltip functionality

@end
