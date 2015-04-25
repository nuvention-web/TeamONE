//
//  Activity.h
//  BabyNinja
//
//  Created by EVA on 4/25/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Diapers.h"


@interface Activity : PFObject<PFSubclassing>

@property (nonatomic, strong) NSString * activityType;
@property (nonatomic, strong) NSDate *timeStamp;
@property (nonatomic, strong) NSString *activityID;


@property (nonatomic, strong) PFObject *diaperObject;




@end
