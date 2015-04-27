//
//  PoopTypeSelectionViewController.m
//  BabyNinja
//
//  Created by Sneha on 4/23/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "PoopTypeSelectionView.h"

@interface PoopTypeSelectionView (){
    NSArray *colorsArray;
    NSArray *textureArray;
}

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
    colorsArray = [NSArray arrayWithObjects:_colorYellowSelected,_colorBrownSelected, _colorGreenSelected, _colorBlackSelected, nil];
    textureArray = [NSArray arrayWithObjects:_textureLooseSelected, _textureSolidSelected, nil];
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



-(void)sendPoopToParse:( NSString *)poopColor :( NSString *)poopTexture{

    Activity* newActivity = [Activity returnActivityWithAttibutes:TYPE_DIAPERS_POOP :@"SOMEID"];
    newActivity.diaperObject = [Diapers returnPoopDiapierObject:poopColor texture:poopTexture];
    
//    //Dummuy Baby Tester
//    self.dummyBaby = [[Baby alloc] init];
//    [self.dummyBaby.activities addObject:newActivity];

    [self.delegate poopTypeRecorded:newActivity];
}

// TEXTURE BUTTON PRESSED
- (IBAction)textureLoosePoopPressed:(id)sender {
}


- (IBAction)textureSolidPoopPressed:(id)sender {
}


// COLOR BUTTON PRESSED
- (IBAction)colorBrownPoopPressed:(id)sender {
    
}

- (IBAction)colorYellowPoopPressed:(id)sender {
    
}
- (IBAction)colorBlackPoopPressed:(id)sender {
    
}

- (IBAction)colorGreenPoopPressed:(id)sender {
    
}

- (IBAction)textureSelected:(UIButton*)sender {
    [self processTextureSelectionForIndex:sender.tag];
}

- (IBAction)colorSelected:(UIButton*)sender {
    [self processColorSelectionForIndex:sender.tag];
    if(sender.tag ==0){
        [self sendPoopToParse:TYPE_DIAPERS_POOP_COLOR_YELLOW : TYPE_DIAPERS_POOP_TEXTURE_LOOSE];
    }else if(sender.tag ==1){
        [self sendPoopToParse:TYPE_DIAPERS_POOP_COLOR_BROWN : TYPE_DIAPERS_POOP_TEXTURE_LOOSE];
    }else if(sender.tag ==2){
        [self sendPoopToParse:TYPE_DIAPERS_POOP_COLOR_GREEN : TYPE_DIAPERS_POOP_TEXTURE_LOOSE];
    }else if(sender.tag ==3){
        [self sendPoopToParse:TYPE_DIAPERS_POOP_COLOR_BLACK : TYPE_DIAPERS_POOP_TEXTURE_LOOSE];
    }
}

-(void)processColorSelectionForIndex:(NSInteger)tag{
    
    for (int i=0; i<4; i++) {
        if(i==tag)
            [(UIImageView*)[colorsArray objectAtIndex:i] setHidden:NO];
        else
            [(UIImageView*)[colorsArray objectAtIndex:i] setHidden:YES];
    }
}

-(void)processTextureSelectionForIndex:(NSInteger)tag{
    
    for (int i=0; i<2; i++) {
        if(i==tag)
            [(UIImageView*)[textureArray objectAtIndex:i] setHidden:NO];
        else
            [(UIImageView*)[textureArray objectAtIndex:i] setHidden:YES];
    }
}

- (IBAction)okayButtonPressed:(id)sender {
    NSLog(@"OK BUTTON");
    Activity* newActivity = [Activity returnActivityWithAttibutes:TYPE_DIAPERS_POOP :@"SOMEID"];
//    newActivity.diaperObject = [Diapers returnPoopDiapierObject:poopColor texture:poopTexture];
    
    [self.delegate poopTypeRecorded:[Activity new]];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"poopRecorded" object:[Poop new]];
//    [self.poopTypedelegate poopTypeRecorded:[Poop new]];


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

