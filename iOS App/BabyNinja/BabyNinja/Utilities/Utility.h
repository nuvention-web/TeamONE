//
//  Utility.h
//  BabyNinja
//
//  Created by Sneha on 4/27/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject

+(id)sharedUtility;

-(void)saveUserDefaultObject:(id)object forKey:(NSString*)key;

-(id)userDefaultForKey:(NSString*)key;

@end
