//
//  Utility.m
//  BabyNinja
//
//  Created by Sneha on 4/27/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+ (id)sharedUtility {
    
    static Utility *utility = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        utility = [[self alloc] init];
    });
    return utility;
}


-(void)saveUserDefaultObject:(id)object forKey:(NSString*)key{
    NSUserDefaults *myDefaults = [[NSUserDefaults alloc]
                                  initWithSuiteName:AppGroupFile];
    [myDefaults setObject:object forKey:key];
}

-(id)userDefaultForKey:(NSString*)key{
    NSUserDefaults *myDefaults = [[NSUserDefaults alloc]
                                  initWithSuiteName:AppGroupFile];
    
    return [myDefaults objectForKey:key];
}

@end
