//
//  Baby.h
//  BabyNinja
//
//  Created by Sneha on 2/20/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Baby : NSObject

@property (nonatomic, strong) NSString *babyName;

@property (nonatomic, strong) NSString *babyId;

@property (nonatomic, strong) NSString *babyImageURL;

@property (nonatomic, strong) NSDate *babyDOB;

@property (nonatomic, strong) NSString *babyGender;

@end
