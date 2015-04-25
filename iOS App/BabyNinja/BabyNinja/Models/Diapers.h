//
//  Diapers.h
//  
//
//  Created by EVA on 4/25/15.
//
//


#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Diapers : PFObject<PFSubclassing>

@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *poopTexture;
@property (nonatomic, strong) NSString *type;




@end
