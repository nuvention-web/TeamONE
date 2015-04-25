//
//  PeeTypeSelectionViewController.m
//  
//
//  Created by EVA on 4/25/15.
//
//

#import "PeeTypeSelectionViewController.h"

@interface PeeTypeSelectionViewController ()

@end

@implementation PeeTypeSelectionViewController


// THIS CODE IS SPECIFIC FOR PEE  - DELETE IF CLASS FUNCTION WORKS
-(Diapers *)returnPeeDiapierObject:(NSString*)peeColor :(NSString*)type{
    Diapers *newPeeObject = [[Diapers alloc] init];
    newPeeObject.color = peeColor;
    newPeeObject.type = type;
    return newPeeObject;
}



-(void)sendPeeToParse:(const NSString *)peeColor{
    
    Activity* newActivity = [Activity returnActivityWithAttibutes:TYPE_DIAPERS_PEE :@"SOMEID"];
    newActivity.diaperObject = [Diapers returnPeeDiapierObject:peeColor];
    [newActivity saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"DONE DONE");
        } else {
            NSLog(@"NOT DONE");        }
    }];
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


// COLOR OF PEE

- (IBAction)yellowPeePressed:(id)sender {
        [self sendPeeToParse:TYPE_DIAPERS_POOP_COLOR_GREEN];
}

- (IBAction)brownPeePressed:(id)sender {
         [self sendPeeToParse:TYPE_DIAPERS_POOP_COLOR_GREEN];
}
@end
