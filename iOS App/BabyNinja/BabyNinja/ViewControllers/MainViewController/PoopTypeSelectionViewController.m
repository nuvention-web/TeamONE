//
//  PoopTypeSelectionViewController.m
//  BabyNinja
//
//  Created by Sneha on 4/23/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "PoopTypeSelectionViewController.h"

@interface PoopTypeSelectionViewController ()

@end

@implementation PoopTypeSelectionViewController


-(Poop *)returnPoopWithColor:(NSString*)color{
    Poop *newPoop = [[Poop alloc] init];
    newPoop.poopColor = color;
    NSDate *currentPoopTime = [NSDate date];
    newPoop.poopTime = currentPoopTime;
    return newPoop;
}


-(void)sendPoopToParse:(Poop *)poop{
    
    PFObject *poopParse = [PFObject objectWithClassName:@"Poop"];
    poopParse[@"name"] = [FBSDKProfile currentProfile].name;
    poopParse[@"id"] = [FBSDKProfile currentProfile].userID;
    poopParse[@"color"] = poop.poopColor;
    poopParse[@"time"] = poop.poopTime;
    [poopParse saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
        } else {
            NSLog(@"FAILED!!");
        }
    }];
}





- (void)viewDidLoad {
    [super viewDidLoad];
//    poopCounter = 0;
    NSDate *currentPoopTime = [NSDate date];
    __block int counter = 0;  // Check how many poops today
    NSUInteger limit = 1500;
    PFQuery *query = [PFQuery queryWithClassName:@"Poop"];
    [query setLimit: limit];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
     {
         if (!error) {
             for (id element in objects){
                 NSString *dateToday = [NSString stringWithFormat:@"%@",[NSDate date]];
                 NSString *dateDB = [NSString stringWithFormat:@"%@", element[@"time"]];
                 if([[dateDB substringToIndex:10] isEqualToString:[dateToday substringToIndex:10]])  {
                     counter++;
                 }
                 
             }
         } else {
             NSString *errorString = [[error userInfo] objectForKey:@"error"];
             NSLog(@"Error: %@", errorString);
         }
//         self.poopCounter.text =[@(counter) stringValue];
     }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// TEXTURE BUTTON PRESSED
- (IBAction)textureLoosePoopPressed:(id)sender {
}


- (IBAction)textureSolidPoopPressed:(id)sender {
}


// COLOR BUTTON PRESSED
- (IBAction)colorBrownPoopPressed:(id)sender {
    NSString *myColor = @"BROWN";
    Poop *getPoop = [self returnPoopWithColor:myColor];
    [self sendPoopToParse:getPoop];
}

- (IBAction)colorYellowPoopPressed:(id)sender {
    NSString *myColor = @"YELLOW";
    Poop *getPoop = [self returnPoopWithColor:myColor];
    [self sendPoopToParse:getPoop];
}
- (IBAction)colorBlackPoopPressed:(id)sender {
    NSString *myColor = @"BLACK";
    Poop *getPoop = [self returnPoopWithColor:myColor];
    [self sendPoopToParse:getPoop];
}

- (IBAction)colorGreenPoopPressed:(id)sender {
    NSString *myColor = @"GREEN";
    Poop *getPoop = [self returnPoopWithColor:myColor];
    [self sendPoopToParse:getPoop];
    
}
@end
