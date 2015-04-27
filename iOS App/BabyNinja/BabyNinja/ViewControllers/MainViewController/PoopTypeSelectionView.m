//
//  PoopTypeSelectionViewController.m
//  BabyNinja
//
//  Created by Sneha on 4/23/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "PoopTypeSelectionView.h"

@interface PoopTypeSelectionView ()

@end

@implementation PoopTypeSelectionView

-(id)init{
    self = [super init];
    if(self){
//        self = [[[NSBundle mainBundle] loadNibNamed:@"PoopTypeSelectionView" owner:self options:nil] objectAtIndex:0];
    }
    
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
}
//-(void)setPoopTypedelegate:(id<PoopTypeSelectionDelegate>)poopTypedelegate{
//    _poopTypedelegate = poopTypedelegate;
//}

// THIS CODE IS SPECIFIC FOR POOP  - DELETE IF CLASS FUNCTION WORKS
-(Diapers *)returnPoopDiapierObject:(NSString*)poopColor :(NSString*)poopTexture :(NSString*)type{
    Diapers *newDiaperObject = [[Diapers alloc] init];
    newDiaperObject.color = poopColor;
    newDiaperObject.poopTexture = poopTexture;
    newDiaperObject.type = type;
    return newDiaperObject;
}



-(void)sendPoopToParse:(const NSString *)poopColor :(const NSString *)poopTexture{

    Activity* newActivity = [Activity returnActivityWithAttibutes:TYPE_DIAPERS_POOP :@"SOMEID"];
    newActivity.diaperObject = [Diapers returnPoopDiapierObject:poopColor :poopTexture];
    
    //Dummuy Baby Tester
    self.dummyBaby = [[Baby alloc] init];
    [self.dummyBaby.activities addObject:newActivity];
    
    
    
    //
    NSLog(@"HEERE %@", self.dummyBaby.activities[0]);
    NSLog(@"HEERE2 %@", newActivity);
    
    [newActivity saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"DONE DONE");
        } else {
            NSLog(@"NOT DONE");        }
    }];
    

}

// TEXTURE BUTTON PRESSED
- (IBAction)textureLoosePoopPressed:(id)sender {
}


- (IBAction)textureSolidPoopPressed:(id)sender {
}


// COLOR BUTTON PRESSED
- (IBAction)colorBrownPoopPressed:(id)sender {
    [self sendPoopToParse:TYPE_DIAPERS_POOP_COLOR_BROWN : TYPE_DIAPERS_POOP_TEXTURE_LOOSE];
}

- (IBAction)colorYellowPoopPressed:(id)sender {
    [self sendPoopToParse:TYPE_DIAPERS_POOP_COLOR_YELLOW : TYPE_DIAPERS_POOP_TEXTURE_LOOSE];
}
- (IBAction)colorBlackPoopPressed:(id)sender {
    [self sendPoopToParse:TYPE_DIAPERS_POOP_COLOR_BLACK : TYPE_DIAPERS_POOP_TEXTURE_LOOSE];
}

- (IBAction)colorGreenPoopPressed:(id)sender {
    [self sendPoopToParse:TYPE_DIAPERS_POOP_COLOR_GREEN : TYPE_DIAPERS_POOP_TEXTURE_LOOSE];
}

- (IBAction)textureSelected:(id)sender {
    
}

- (IBAction)colorSelected:(id)sender {
    
}

- (IBAction)okayButtonPressed:(id)sender {
    NSLog(@"OK BUTTON");
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"poopRecorded" object:[Poop new]];
//    [self.poopTypedelegate poopTypeRecorded:[Poop new]];
    
}

-(void)dealloc{
    NSLog(@"I am %x", self);
}
@end






/// FUTURE REFERECNE FOR QUERY
//    poopCounter = 0;
//NSDate *currentPoopTime = [NSDate date];
//__block int counter = 0;  // Check how many poops today
//NSUInteger limit = 1500;
//PFQuery *query = [PFQuery queryWithClassName:@"Poop"];
//[query setLimit: limit];
//[query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
// {
//     if (!error) {
//         for (id element in objects){
//             NSString *dateToday = [NSString stringWithFormat:@"%@",[NSDate date]];
//             NSString *dateDB = [NSString stringWithFormat:@"%@", element[@"time"]];
//             if([[dateDB substringToIndex:10] isEqualToString:[dateToday substringToIndex:10]])  {
//                 counter++;
//             }
//             
//         }
//     } else {
//         NSString *errorString = [[error userInfo] objectForKey:@"error"];
//         NSLog(@"Error: %@", errorString);
//     }
// }];


//
//    PFObject *poopParse = [PFObject objectWithClassName:@"Poop"];
//    poopParse[@"name"] = [FBSDKProfile currentProfile].name;
//    poopParse[@"id"] = [FBSDKProfile currentProfile].userID;
//    poopParse[@"color"] = poop.poopColor;
//    poopParse[@"time"] = poop.poopTime;
//    [poopParse saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (succeeded) {
//            // The object has been saved.
//        } else {
//            NSLog(@"FAILED!!");
//        }
//    }];

