
//
//  Baby.m
//  BabyNinja
//
//  Created by Sneha on 2/20/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "Baby.h"

@implementation Baby

@dynamic babyName;
@dynamic babyId;
@dynamic babyImageURL;
@dynamic babyDOB;
@dynamic babyGender;
@dynamic babyWeight;
@dynamic activities;



+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return @"Baby";
}



@end