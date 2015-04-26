//
//  Baby.h
//  BabyNinja
//
//  Created by Sneha on 2/20/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/PFObject+Subclass.h>

@interface Baby : PFObject<PFSubclassing>

@property (nonatomic, strong) NSString *babyName;
@property (nonatomic, strong) NSString *babyId;
@property (nonatomic, strong) NSString *babyImageURL;
@property (nonatomic, strong) NSDate *babyDOB;
@property (nonatomic, strong) NSString *babyGender;
@property (nonatomic, strong) NSMutableArray *activities; /// the object type inside it would be BabyActivity <BabyActivity.h>


@end
