//
//  Activity.h
//  BabyNinja
//
//  Created by EVA on 4/25/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Diapers.h"
#import <Parse/PFObject+Subclass.h>



@interface Activity : PFObject<PFSubclassing>

@property (nonatomic, strong) NSString * activityType;
@property (nonatomic, strong) NSNumber *timeStamp;
@property (nonatomic, strong) NSString *activityID;
@property (nonatomic, strong) PFObject *diaperObject;
@property (nonatomic, strong) PFObject *feedObject;
@property (nonatomic, strong) PFObject *sleepObject;
@property (nonatomic, strong) NSString *babyId;

+(Activity *)returnActivityWithAttibutes:(NSString*)type:(NSString*)activityID;


@end
