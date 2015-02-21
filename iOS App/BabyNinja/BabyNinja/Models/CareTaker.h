//
//  CareTaker.h
//  BabyNinja
//
//  Created by Sneha on 2/20/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CareTaker : NSObject

@property (nonatomic, strong) NSString *careTakerName;

@property (nonatomic, strong) NSString *careTakerId;

@property (nonatomic, strong) NSString *careTakerUsername;

@property (nonatomic, strong) NSString *careTakerImageURL;

@property (nonatomic, strong) NSDate *careTakerRelationToBaby;

@property (nonatomic, strong) NSString *careTakerGender;

@end
