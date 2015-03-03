//
//  AlertInterfaceController.h
//  BabyNinja
//
//  Created by Sneha on 2/10/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface AlertInterfaceController : WKInterfaceController

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *diaperNumberAlertLabel;

@property (nonatomic, assign)  NSInteger diaperCount;

@end
