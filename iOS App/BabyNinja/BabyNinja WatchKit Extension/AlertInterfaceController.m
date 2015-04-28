//
//  AlertInterfaceController.m
//  BabyNinja
//
//  Created by Sneha on 2/10/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "AlertInterfaceController.h"
#import "WatchConstants.h"
#import "WatchUtility.h"

@interface AlertInterfaceController()

@end


@implementation AlertInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
//    NSNumber *number = (NSNumber*)context;
    NSString *string = [NSString stringWithFormat:@"             Alert!                            You are just left with %d diapers. Time to buy more!", [[[WatchUtility sharedUtility] userDefaultForKey:DiaperCount] intValue] ];
        [self.diaperNumberAlertLabel setText:string];
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
//    [self.diaperNumberAlertLabel setText:[NSString stringWithFormat:@"             Alert!                            You are just left with %ld diapers. Time to buy more!", self.diaperCount]];
    [NSTimer scheduledTimerWithTimeInterval:2.5f
                                     target:self
                                   selector:@selector(smartAlert)
                                   userInfo:nil
                                    repeats:NO];
    
}

-(void)smartAlert{
    NSString *string = [NSString stringWithFormat:@"Charlie have been pooping loose from last 3 times. Please take good care of hydration and check for skin rashes."];
    [self.diaperNumberAlertLabel setText:string];
    [NSTimer scheduledTimerWithTimeInterval:4.5f
                                     target:self
                                   selector:@selector(goBackToRootController)
                                   userInfo:nil
                                    repeats:NO];
}

-(void)goBackToRootController{
//    NSDictionary *requst = @{@"diaper":@"changed"};
    
//    [AlertInterfaceController openParentApplication:requst reply:^(NSDictionary *replyInfo, NSError *error) {
//        
//        if (error) {
//            NSLog(@"%@", error);
//        } else {
//            NSLog(@"%@", [replyInfo objectForKey:@"newDiaperCount"]);
////            [self.label setText:[replyInfo objectForKey:@"response"]];
//        }
//        
//    }];
    [self popToRootController];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



