//
//  DiaperTypeInterfaceController.m
//  BabyNinja
//
//  Created by Sneha on 3/3/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "DiaperTypeInterfaceController.h"


@interface DiaperTypeInterfaceController()

@end


@implementation DiaperTypeInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)doMenuItemAction {
    // Handle menu action.
    NSLog(@"Menuuuuuuu");
    NSDictionary *requst = @{@"diaper":@"changed"};
    
    [DiaperTypeInterfaceController openParentApplication:requst reply:^(NSDictionary *replyInfo, NSError *error) {
        
        if (error) {
            NSLog(@"%@", error);
        } else {
            NSLog(@"%@", [replyInfo objectForKey:@"newDiaperCount"]);
            NSInteger newDiaperCount = [[replyInfo objectForKey:@"newDiaperCount"]integerValue];
            NSInteger minDiaperCount = [[replyInfo objectForKey:@"minDiaperCount"]integerValue];
//            MinDiaperCount
            if(newDiaperCount<=minDiaperCount){
                //                AlertInterfaceController *alert = [[AlertInterfaceController alloc]init];
//                [NSNumber numberWithInteger:newDiaperCount]
                [self pushControllerWithName:@"alert" context:[NSNumber numberWithInteger:newDiaperCount]];
            } else {
                [self popToRootController];
            }
            //            [self.label setText:[replyInfo objectForKey:@"response"]];
        }
        
    }];
    
    
}
     
     
@end

