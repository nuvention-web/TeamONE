//
//  TextureSelectionInterfaceController.m
//  BabyNinja
//
//  Created by Sneha on 2/10/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "TextureSelectionInterfaceController.h"
#import "AlertInterfaceController.h"

@interface TextureSelectionInterfaceController()

@end


@implementation TextureSelectionInterfaceController

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

- (IBAction)goBackToPreviousScreen {
    [self popToRootController];

    
    
}

- (id)contextForSegueWithIdentifier:(NSString *)segueIdentifier {
    if ([segueIdentifier isEqualToString:@"SolidTexture"]) {
        return [NSMutableDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"solid", nil] forKeys:[NSArray arrayWithObjects:@"texture", nil] ];
    } else if ([segueIdentifier isEqualToString:@"LooseTexture"]) {
        return [NSMutableDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"loose", nil] forKeys:[NSArray arrayWithObjects:@"texture", nil] ];
    } else
        return nil;
}

@end



