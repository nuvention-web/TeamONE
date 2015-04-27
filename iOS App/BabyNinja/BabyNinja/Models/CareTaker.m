//
//  CareTaker.m
//  BabyNinja
//
//  Created by Sneha on 2/20/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "CareTaker.h"

@implementation CareTaker

@dynamic careTakerName;

@dynamic careTakerId;

@dynamic careTakerUsername;

@dynamic careTakerImageURL;

@dynamic careTakerRelationToBaby;

@dynamic careTakerGender;

@dynamic careTakerBabyArray;




-(id)init{
    self = [super init];
    if(self) {
     //   self.careTakerBabyArray = [[NSMutableArray alloc] init];
    }
    return self;
}


+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return @"CareTaker";
}






@end
