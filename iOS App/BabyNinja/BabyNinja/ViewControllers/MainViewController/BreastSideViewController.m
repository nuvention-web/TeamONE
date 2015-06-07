//
//  BreastSideViewController.m
//  BabyNinja
//
//  Created by Sneha on 4/27/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "BreastSideViewController.h"
#import "FeedOuncesViewController.h"


@interface BreastSideViewController (){
    Activity *currentActivity;
}

@end

@implementation BreastSideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    currentActivity = [Activity returnActivityWithAttibutes:TYPE_FEED :@"SOME ID"];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(Feed *)returnFeedObject:(NSNumber*)volume :(NSString*)type :(NSString*)breastSide{
    Feed *newFeed = [[Feed alloc] init];
    newFeed.volume = volume;
    newFeed.type = type;
    newFeed.breastSide = breastSide;
    return newFeed;
}


- (IBAction)leftSelected:(id)sender {
    currentActivity.feedObject = [self returnFeedObject:nil :FEED_TYPE_BREAST :FEED_TYPE_BREAST_LEFT];
//    
//    Feed *newFeed = [[Feed alloc] init];
//    newFeed.volume = @12;
//    newFeed.type = @"HELLO";
//    newFeed.breastSide = @"HELLO";
//    
    
    
    
    
    
    
    [self.delegate breastFeedRecorded:currentActivity];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)rightSelected:(id)sender {
    currentActivity.feedObject = [self returnFeedObject:nil :FEED_TYPE_BREAST :FEED_TYPE_BREAST_RIGHT];
    
    [self.delegate breastFeedRecorded:currentActivity];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)bothSidesSelected:(id)sender {
    currentActivity.feedObject = [self returnFeedObject:nil :FEED_TYPE_BREAST :FEED_TYPE_BREAST_BOTH];
    
    [self.delegate breastFeedRecorded:currentActivity];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
//- (IBAction)bottleSelected:(id)sender {
//    
//    NSLog(@"here");
//    
//        FeedOuncesViewController *controller = [[FeedOuncesViewController alloc]init];
//        controller.delegate =self;
//        [self.navigationController pushViewController:controller animated:YES];
//    
//}
- (IBAction)typeSegmentControlChanged:(id)sender {
    
    if(self.typeSegmentControl.selectedSegmentIndex == 0)
    {
        NSLog(@"Brest");
    }else{
                FeedOuncesViewController *controller = [[FeedOuncesViewController alloc]init];
               // controller.delegate =self;
                [self.navigationController pushViewController:controller animated:YES];
        
    }

}
@end
