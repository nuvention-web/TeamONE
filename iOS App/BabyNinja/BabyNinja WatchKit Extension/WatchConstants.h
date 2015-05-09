//
//  Constants.h
//  BabyNinja
//
//  Created by Sneha on 4/16/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

FOUNDATION_EXPORT NSString *const UDefaultLoggedIn;
FOUNDATION_EXPORT NSString *const ULogoutNotification;
FOUNDATION_EXPORT NSString *const AppGroupFile;
FOUNDATION_EXPORT NSString *const DiaperCount;
FOUNDATION_EXPORT NSString *const MinDiaperCount;
FOUNDATION_EXPORT NSString *const NewDiaperCount;