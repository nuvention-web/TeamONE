//
//  BabyActivity.h
//  BabyNinja
//
//  Created by Sneha on 4/25/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BabyActivity : NSObject
@property (nonatomic, strong) NSString * activityType;
@property (nonatomic, strong) NSDate *timeStamp;
@property (nonatomic, strong) NSString *activityID;

@end
