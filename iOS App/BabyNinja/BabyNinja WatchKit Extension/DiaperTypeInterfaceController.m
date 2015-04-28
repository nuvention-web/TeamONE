//
//  DiaperTypeInterfaceController.m
//  BabyNinja
//
//  Created by Sneha on 3/3/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "DiaperTypeInterfaceController.h"
#import "WatchUtility.h"
#import "WatchConstants.h"

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
//    NSDictionary *requst = @{@"diaper":@"changed"};

    [self recordPee];
}

-(void)recordPee{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"diaper" forKey:@"activity"];
    [dict setObject:@"pee" forKey:@"type"];
    
    int diapers = [[[WatchUtility sharedUtility] userDefaultForKey:DiaperCount] intValue];
    [[WatchUtility sharedUtility] saveUserDefaultObject:[NSNumber numberWithInt:diapers-1] forKey:DiaperCount];
    
    if(diapers - 1 <= [[[WatchUtility sharedUtility] userDefaultForKey:MinDiaperCount] intValue]){
        [self pushControllerWithName:@"alert" context:[NSNumber numberWithInteger:diapers - 1]];
    } else {
        [self popToRootController];
    }
    
    [DiaperTypeInterfaceController openParentApplication:dict reply:^(NSDictionary *replyInfo, NSError *error) {
        
        if (error) {
            NSLog(@"%@", error);
        } else {
            NSLog(@"%@", replyInfo);
            //            [self.label setText:[replyInfo objectForKey:@"response"]];
        }
        
    }];
}

- (IBAction)peeTapped {
    [self recordPee];

}
@end

