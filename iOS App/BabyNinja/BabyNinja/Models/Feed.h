//
//  Feed.h
//  BabyNinja
//
//  Created by EVA on 4/27/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/PFObject+Subclass.h>

@interface Feed : PFObject<PFSubclassing>

@property (nonatomic, strong) NSNumber *volume;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *breastSide;


@end
