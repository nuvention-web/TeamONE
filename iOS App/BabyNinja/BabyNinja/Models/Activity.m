//
//  Activity.m
//  BabyNinja
//
//  Created by EVA on 4/25/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "Activity.h"

@implementation Activity

@dynamic activityID;
@dynamic timeStamp;
@dynamic activityType;
@dynamic babyId;
//@dynamic diaperObject;

//-(NSTimeInterval*)getTimeStamp{
//   NSTimeInterval timeStamp = [[NSDate date] timeIntervalSince1970];
//   return &timeStamp;
//}



+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return @"Activity";
}


+(Activity *)returnActivityWithAttibutes:(NSString*)type:(NSString*)activityID{
    
    NSTimeInterval timeStamp = [[NSDate date] timeIntervalSince1970];
    NSNumber *timeStampObj = [NSNumber numberWithInt:timeStamp];
    Activity *newActivity = [[Activity alloc] init];
    newActivity.activityID = activityID;
    newActivity.activityType = type;
    newActivity.timeStamp = timeStampObj;

    
    
    //newActivity.diaperObject = nil;
    return newActivity;
}






@end
