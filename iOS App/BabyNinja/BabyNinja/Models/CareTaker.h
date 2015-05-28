//
//  CareTaker.h
//  BabyNinja
//
//  Created by Sneha on 2/20/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/PFObject+Subclass.h>
#import "Parse/PFFile.h"

@interface CareTaker : PFObject <PFSubclassing>

@property (nonatomic, strong) NSString *careTakerName;

@property (nonatomic, strong) NSString *careTakerId;

@property (nonatomic, strong) NSString *careTakerUsername;

@property (nonatomic, strong) PFFile *careTakerImageURL;

@property (nonatomic, strong) NSDate *careTakerRelationToBaby;

@property (nonatomic, strong) NSString *careTakerGender;

@property (nonatomic, strong) NSMutableArray *careTakerBabyArray;

@end
