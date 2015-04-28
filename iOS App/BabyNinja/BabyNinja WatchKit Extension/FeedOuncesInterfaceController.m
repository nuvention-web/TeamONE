//
//  FeedOuncesInterfaceController.m
//  BabyNinja
//
//  Created by Sneha on 4/27/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "FeedOuncesInterfaceController.h"

@protocol dddd <NSObject>

@end

@interface FeedOuncesInterfaceController ()

@end

@implementation FeedOuncesInterfaceController

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

- (IBAction)twoOzSelected {
    [self recordFeedWithOz:[NSNumber numberWithInt:2]];
}

- (IBAction)fiveOzSelected {
    [self recordFeedWithOz:[NSNumber numberWithInt:5]];

}

- (IBAction)tenOzSelected {
    [self recordFeedWithOz:[NSNumber numberWithInt:10]];

}

- (IBAction)fifteenOzSelected {
    [self recordFeedWithOz:[NSNumber numberWithInt:15]];

}

- (IBAction)twentyOzSelected {
    [self recordFeedWithOz:[NSNumber numberWithInt:20]];

}


-(void)recordFeedWithOz:(NSNumber*)oz{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"feed" forKey:@"activity"];
    [dict setObject:@"oz" forKey:@"type"];
    [dict setObject:oz forKey:@"quantity"];
    
    [FeedOuncesInterfaceController openParentApplication:dict reply:^(NSDictionary *replyInfo, NSError *error) {
        
        if (error) {
            NSLog(@"%@", error);
        } else {
            NSLog(@"%@",replyInfo);
        }
        
    }];
    
    [self popController];
}
@end



