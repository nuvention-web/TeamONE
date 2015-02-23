//
//  AlertInterfaceController.m
//  BabyNinja
//
//  Created by Sneha on 2/10/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "AlertInterfaceController.h"


@interface AlertInterfaceController()

@end


@implementation AlertInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [NSTimer scheduledTimerWithTimeInterval:0.9f
                                     target:self
                                   selector:@selector(goBackToRootController)
                                   userInfo:nil
                                    repeats:NO];
    [super willActivate];
}

-(void)goBackToRootController{
    NSDictionary *requst = @{@"request":@"Hello"};
    
    [AlertInterfaceController openParentApplication:requst reply:^(NSDictionary *replyInfo, NSError *error) {
        
        if (error) {
            NSLog(@"%@", error);
        } else {
            NSLog(@"%@", [replyInfo objectForKey:@"response"]);
//            [self.label setText:[replyInfo objectForKey:@"response"]];
        }
        
    }];
    [self popToRootController];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



