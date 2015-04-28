//
//  Feed.m
//  BabyNinja
//
//  Created by EVA on 4/27/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "Feed.h"

@implementation Feed

@dynamic volume;
@dynamic type;
@dynamic breastSide;
@dynamic timeStamp;

+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return @"Feed";
}




@end
