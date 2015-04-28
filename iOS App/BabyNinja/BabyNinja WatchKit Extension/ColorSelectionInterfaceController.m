//
//  ColorSelectionInterfaceController.m
//  BabyNinja
//
//  Created by Sneha on 3/3/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "ColorSelectionInterfaceController.h"
#import "AlertInterfaceController.h"
#import "WatchConstants.h"
#import "WatchUtility.h"

@interface ColorSelectionInterfaceController()

@end


@implementation ColorSelectionInterfaceController

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
    
    [ColorSelectionInterfaceController openParentApplication:requst reply:^(NSDictionary *replyInfo, NSError *error) {
        
        if (error) {
            NSLog(@"%@", error);
        } else {
            NSLog(@"%@", [replyInfo objectForKey:@"newDiaperCount"]);
            NSInteger newDiaperCount = [[replyInfo objectForKey:@"newDiaperCount"]integerValue];
            NSInteger minDiaperCount = [[replyInfo objectForKey:@"minDiaperCount"]integerValue];
            //            MinDiaperCount
            if(newDiaperCount<=minDiaperCount){
                [self pushControllerWithName:@"alert" context:[NSNumber numberWithInteger:newDiaperCount]];
            } else {
                [self popToRootController];
            }
            //            [self.label setText:[replyInfo objectForKey:@"response"]];
        }
        
    }];
    
    
}

- (IBAction)colorSelected {
    NSDictionary *requst = @{@"diaper":@"changed"};
    
    int diapers = [[[WatchUtility sharedUtility] userDefaultForKey:DiaperCount] intValue];
    [[WatchUtility sharedUtility] saveUserDefaultObject:[NSNumber numberWithInt:diapers-1] forKey:DiaperCount];
    
    if(diapers - 1 <= [[[WatchUtility sharedUtility] userDefaultForKey:MinDiaperCount] intValue]){
        [self pushControllerWithName:@"alert" context:[NSNumber numberWithInteger:diapers - 1]];
    } else {
        [self popToRootController];
    }
    
    [ColorSelectionInterfaceController openParentApplication:requst reply:^(NSDictionary *replyInfo, NSError *error) {
        
        if (error) {
            NSLog(@"%@", error);
        } else {

        }
        
    }];
}



@end



