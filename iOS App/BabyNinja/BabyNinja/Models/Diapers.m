//
//  Diapers.m
//  
//
//  Created by EVA on 4/25/15.
//
//

#import "Diapers.h"

@implementation Diapers


@dynamic color;
@dynamic poopTexture;
@dynamic type;
@dynamic timeStamp;


+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return @"Diapers";
}


+(Diapers *)returnPoopDiapierObject:(NSString*)poopColor texture:(NSString*)poopTexture{
    Diapers *newDiaperObject = [[Diapers alloc] init];
    newDiaperObject.color = poopColor;
    newDiaperObject.poopTexture = poopTexture;
    newDiaperObject.type = TYPE_DIAPERS_POOP;
    return newDiaperObject;
}


+(Diapers *)returnPeeDiapierObject:(NSString*)peeColor{
    Diapers *newPeeObject = [[Diapers alloc] init];
    newPeeObject.color = peeColor;
    newPeeObject.poopTexture = @"";
    newPeeObject.type = @"PEE";
    return newPeeObject;
}




@end
