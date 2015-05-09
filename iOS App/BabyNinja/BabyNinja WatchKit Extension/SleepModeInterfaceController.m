//
//  SleepModeInterfaceController.m
//  BabyNinja
//
//  Created by Sneha on 3/10/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "SleepModeInterfaceController.h"

@interface SleepModeInterfaceController ()
@property (strong,nonatomic) NSTimer* timer;
@property (strong, nonatomic) NSDate *startTime;
@end

@implementation SleepModeInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    self.startTime = [NSDate date];
    [self updateTheTimeLabel];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                  target:self
                                                selector:@selector(updateTheTimeLabel)
                                                userInfo:nil
                                                 repeats:YES];
    // Do any additional setup after loading the view from its nib.
}

-(void)updateTheTimeLabel{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"hh:mm:ss a"];
    NSDate *date = [NSDate date];
    NSTimeInterval timeInterval = [date timeIntervalSinceDate:self.startTime];
    //    NSLog(@"Current Date: %@", [formatter stringFromDate:[NSDate date]]);
    self.timeLabel.text = [self stringFromTimeInterval:timeInterval];
}

- (NSString *)stringFromTimeInterval:(NSTimeInterval)interval {
    NSInteger ti = (NSInteger)interval;
    NSInteger seconds = ti % 60;
    NSInteger minutes = (ti / 60) % 60;
    NSInteger hours = (ti / 3600);
    return [NSString stringWithFormat:@"%02ld:%02ld:%02ld", (long)hours, (long)minutes, (long)seconds];
}

- (IBAction)awakeButtonPressed {
    [self recordSleep];
    [self popController];
//    [self dismissController];
}

-(void)recordSleep{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"sleep" forKey:@"activity"];
    [dict setObject:self.startTime forKey:@"startTime"];
    [dict setObject:[NSDate date] forKey:@"finishTime"];
    
    [SleepModeInterfaceController openParentApplication:dict reply:^(NSDictionary *replyInfo, NSError *error) {
        
        if (error) {
            NSLog(@"%@", error);
        } else {
            NSLog(@"%@",replyInfo);
        }
        
    }];
    
}


- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



