//
//  Sleep.h
//  BabyNinja
//
//  Created by EVA on 4/28/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sleep : PFObject<PFSubclassing>

@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSNumber *finishTime;

@end
