//
//  ViewController.m
//  BabyNinja
//
//  Created by Sneha on 1/29/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "MainViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "DiaperChangeViewController.h"
#import "SleepModeViewController.h"
#import "PoopTypeSelectionView.h"
#import "FeedOuncesViewController.h"
#import "BreastSideViewController.h"

@interface MainViewController ()<DiaperChangeProtocol, BreastSideFeedDelegate, SleepActivityProtocol, FeedOuncesDelegate>{
    UIView *blackView;
    UIButton *selectedButton;
    Baby *getBaby;
    BOOL isBreastMode;
    __block NSString *returnString;
    
}

@property(nonatomic, strong) UIButton *openDrawerButton;
@property (nonatomic) NSInteger selectedColorIndex;
@property (nonatomic) NSInteger selectedTextureIndex;
@property (weak, nonatomic) IBOutlet UILabel *lastFeedActivityLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastSleepActivityLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastDiaperActivityLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastDiaperTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastFeedTypeLabel;

@end


@implementation MainViewController

#pragma mark - Managing the view
-(id)initWithCareTaker:(CareTaker*)careTaker{
    self = [super init];
    
    if(self){
        self.careTaker = careTaker;
        
    }
    return self;
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    returnString = [[NSString alloc] init];
    getBaby = self.careTaker.careTakerBabyArray[0];
    isBreastMode = NO;
    
    [[Utility sharedUtility] saveUserDefaultObject:[NSNumber numberWithInt:12] forKey:DiaperCount];
    [[Utility sharedUtility] saveUserDefaultObject:[NSNumber numberWithInt:10] forKey:MinDiaperCount];
    
    //Sets the labels
    [self setLatestLabelsByQuery:@"SLEEP"];
    [self setLatestLabelsByQuery:@"FEED"];
    [self setLatestLabelsByQuery:@"DIAPER"];


//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{ // 1
//
//        dispatch_async(dispatch_get_main_queue(), ^{ // 2
//            
//            NSLog(@"RETURN STRING1 %@", returnString);
//            
//
//        });
//            NSLog(@"RETURN STRING2 %@", returnString);
//
//    });
//            NSLog(@"RETURN STRING3 %@", returnString);
//    
//    

    // Initialize and add the openDrawerButton
    UIImage *hamburger = [UIImage imageNamed:@"hamburger-1"];
    NSParameterAssert(hamburger);
    self.title = @"BABYNINJA";
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    // create the left slider button
    self.openDrawerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.openDrawerButton.frame = CGRectMake(15.0f, 25.0f, 30.0f, 30.0f);
    [self.openDrawerButton setImage:hamburger forState:UIControlStateNormal];
    [self.openDrawerButton addTarget:self action:@selector(openDrawer:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc]initWithCustomView:self.openDrawerButton];
    self.navigationItem.leftBarButtonItem = button;
    
    //create an instance of the radial menu and set ourselves as the delegate.
    self.radialMenu = [[ALRadialMenu alloc] init];
    self.radialMenu.delegate = self;
    
    self.radialFeedMenu = [[ALRadialMenu alloc] init];
    self.radialFeedMenu.delegate = self;
    [self.view addSubview:self.openDrawerButton];

}






#pragma mark - Protocol Methods



-(void)setLatestLabelsByQuery:(NSString*)activityType{
    
    __block NSString *newLabel = [[NSString alloc] init];
    //    __block NSString *objectSearchString = [[NSString alloc] init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Activity"];
    [query whereKey:@"babyId" equalTo:getBaby.objectId];
    [query whereKey:@"activityType" equalTo:activityType];
    [query orderByDescending:@"createdAt"];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        
        if([activityType isEqualToString:@"SLEEP"]){
            if(object[@"timeStamp"] == nil){
                newLabel = @"Last Sleep: -";
            }else{
                newLabel = [NSString stringWithFormat:@"Last Sleep: -%@",object[@"timeStamp"]];
            }
            
            self.lastSleepActivityLabel.text = newLabel;
        }
        
        if([activityType isEqualToString:@"FEED"]){
            if(object[@"timeStamp"] == nil){
                newLabel = @"Last Sleep: -";
                self.lastFeedActivityLabel.text = newLabel;
            }else{
                Feed *currentFeed = object[@"feedObject"];
                [self  getTypeByObjectID:currentFeed.objectId :@"feed"];
                NSString *myDateString =[self getLabelByTimeStamp:object[@"timeStamp"]];
                
                
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
                    returnString =  object[@"type"];
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        NSString *feedLabel = [NSString stringWithFormat:@"Last Feed: %@", myDateString];
                        self.lastFeedActivityLabel.text = feedLabel;
                    });
                });
            }
        }
        
        
        if([activityType isEqualToString:@"DIAPER"]){
            if(object[@"timeStamp"] == nil){
                newLabel = @"Last Sleep: -";
                self.lastDiaperActivityLabel.text = newLabel;

            }else{
                    Diapers *currentDiaper = object[@"diaperObject"];
                    [self  getTypeByObjectID:currentDiaper.objectId :@"Diapers"];
                    NSString *myDateString =[self getLabelByTimeStamp:object[@"timeStamp"]];
                
                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
                    returnString =  object[@"type"];
                    
                    dispatch_async(dispatch_get_main_queue(), ^{ // 2
                        NSString *diaperLabel = [NSString stringWithFormat:@"Last Poop: %@", myDateString];
                        self.lastDiaperActivityLabel.text = diaperLabel;
                        });
                    });
                }
        }
    }];
}


-(void)getTypeByObjectID:(NSString*)objectIDString :(NSString*)className{
    
    __block NSString *detailActivityType = [[NSString alloc] init];
    NSLog(@"USING OBJECT ID %@", objectIDString);
    
    PFQuery *query = [PFQuery queryWithClassName:className];
    [query whereKey:@"objectId" equalTo:objectIDString];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{ // 1
        detailActivityType = object[@"type"];
        dispatch_async(dispatch_get_main_queue(), ^{ // 2
            NSLog(@"TESTER %@", detailActivityType);
            
            if([className isEqualToString:@"Diapers"]){
            NSString *diaperLabel = [NSString stringWithFormat:@"Type: %@", detailActivityType];
            self.lastDiaperTypeLabel.text = diaperLabel;
                
            }else if ([className isEqualToString:@"feed"]){
            NSString *feedLabel = [NSString stringWithFormat:@"Type: %@", detailActivityType];
            self.lastFeedTypeLabel.text = feedLabel;
                
            }
            
            
            
        });

        });
    }];
}


-(NSString*)getLabelByTimeStamp:(NSString*)activityTime{
    //    Feed *getFeedObject = activity.feedObject;
    NSString *myTimeStamp = [NSString stringWithFormat:@"%@", activityTime];
    NSTimeInterval _interval=[myTimeStamp doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    
    
    NSString *reTimeStamp = [NSString stringWithFormat:@"%@", date];
    NSString *mySmallerString = [reTimeStamp substringToIndex:16];
    //    NSLog(@"%@", mySmallerString);
    
    return mySmallerString;
    
}


-(NSString*)getLabel:(Activity*)activity{
    //    Feed *getFeedObject = activity.feedObject;
    NSString *myTimeStamp = [NSString stringWithFormat:@"%@", activity.timeStamp];
    NSTimeInterval _interval=[myTimeStamp doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    
    
    NSString *reTimeStamp = [NSString stringWithFormat:@"%@", date];
    NSString *mySmallerString = [reTimeStamp substringToIndex:16];
    //    NSLog(@"%@", mySmallerString);
    
    return mySmallerString;
    
}


-(void)diaperChangeRecorded:(Activity*)activity{
    
    
    NSString *myDateString =[self getLabel:activity];
    NSString *feedLabel = [NSString stringWithFormat:@"Last Change: %@, Type: %@", myDateString, activity.activityType];
    activity.babyId = getBaby.objectId;
    NSLog(@" baby %@",getBaby.objectId);
    self.lastDiaperActivityLabel.text = feedLabel;

    
    [getBaby.activities addObject:activity];
    [activity saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"DONE DONE");
        } else {
            NSLog(@"NOT DONE");        }
    }];
    
    
    
}


-(void)breastFeedRecorded:(Activity*)activity{
    
   [getBaby.activities addObject:activity];
    activity.babyId = getBaby.objectId;
   [activity saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"DONE DONE");
        } else {
            NSLog(@"NOT DONE");
        }
   }];

}


-(void)sleepRecorded:(Activity*)activity{
    

    //    Feed *getFeedObject = activity.feedObject;
    NSString *myTimeStamp = [NSString stringWithFormat:@"%@", activity.timeStamp];
    NSTimeInterval _interval=[myTimeStamp doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    activity.babyId = getBaby.objectId;
    
    NSString *reTimeStamp = [NSString stringWithFormat:@"%@", date];
    NSString *mySmallerString = [reTimeStamp substringToIndex:16];
    //    NSLog(@"%@", mySmallerString);
    
    

    NSString *feedLabel = [NSString stringWithFormat:@"Last Sleep: %@", mySmallerString];
    self.lastSleepActivityLabel.text = feedLabel;
    
    
    [getBaby.activities addObject:activity];
    [activity saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"DONE DONE");
        } else {
            NSLog(@"NOT DONE");
        }
    }];
    
}



-(void)FeedOuncesRecorded:(Activity*)activity{
    //Last Feed: 12.30 pm , Used Left Breast
    
    NSString *myDateString =[self getLabel:activity];
    NSString *feedLabel = [NSString stringWithFormat:@"Last Feed: %@, Used: %@", myDateString, activity.activityType];
    self.lastFeedActivityLabel.text = feedLabel;
    activity.babyId = getBaby.objectId;
    
    [getBaby.activities addObject:activity];
    [activity saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"DONE DONE");
        } else {
            NSLog(@"NOT DONE");
        }
    }];
}



#pragma mark - When Buttons are Pressed



- (IBAction)poopButtonPressed:(id)sender {

    
    
    DiaperChangeViewController *controller2 = [[DiaperChangeViewController alloc]init];
    controller2.delegate = self;
    [self.navigationController pushViewController:controller2 animated:YES];
}




- (IBAction)feedButtonPressed:(id)sender {
    //    [self changeFeedButtonStateImage];
    //    [self.radialFeedMenu buttonsWillAnimateFromButton:sender withFrame:self.feedButton.frame inView:self.view];
    //    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Good Job!" message:@"You have been doing a good job in feeding the baby at regular intervals. Congratulations. " delegate:self cancelButtonTitle:@"Thanks!" otherButtonTitles: nil];
    //    [alert show];
    
    if(isBreastMode){
        BreastSideViewController *controller = [[BreastSideViewController alloc]init];
        controller.delegate =self;
        [self.navigationController pushViewController:controller animated:YES];
    }else {
        FeedOuncesViewController *controller = [[FeedOuncesViewController alloc]init];
        controller.delegate =self;
        [self.navigationController pushViewController:controller animated:YES];
    }
}




-(void)changePoopButtonStateImage{
    if(self.poopButton.tag==0){
        self.poopButton.tag = 1 ; //setting the mode to selected
        [self blackOutTheBackgroundWithRespectToButton:self.poopButton];
        selectedButton = self.poopButton;
        [self.poopButton setImage:[UIImage imageNamed:@"greenTick"] forState:UIControlStateNormal];
    } else {
        self.poopButton.tag = 0 ; //setting the mode to unselected
        [self removeTheBlackOutBackground];
        selectedButton = nil;
        [self.poopButton setImage:[UIImage imageNamed:@"diaper"] forState:UIControlStateNormal];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Diaper Alert!" message:@"You are left with just 8 diapers. Order more!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
}

-(void)changeFeedButtonStateImage{
    if(self.feedButton.tag==0){
        self.feedButton.tag = 1 ; //setting the mode to selected
        selectedButton = self.feedButton;
        [self blackOutTheBackgroundWithRespectToButton:self.feedButton];
        [self.feedButton setImage:[UIImage imageNamed:@"greenTick"] forState:UIControlStateNormal];
    } else {
        self.feedButton.tag = 0 ; //setting the mode to unselected
        selectedButton = nil;
        [self.feedButton setImage:[UIImage imageNamed:@"bottle"] forState:UIControlStateNormal];
    }
}

- (IBAction)sleepOrAwakeButtonPressed:(id)sender {
    
    SleepModeViewController *sleep = [[SleepModeViewController alloc]init];
    sleep.delegate = self;
    [self presentViewController:sleep animated:YES completion:nil];
//    if(self.sleepOrAwakeButton.tag==0){
//        self.sleepOrAwakeButton.tag = 1 ; //setting the mode to selected
//        [self.sleepOrAwakeButton setImage:[UIImage imageNamed:@"awake"] forState:UIControlStateNormal];
//    } else {
//        self.sleepOrAwakeButton.tag = 0 ; //setting the mode to unselected
//        [self removeTheBlackOutBackground];
//        [self.sleepOrAwakeButton setImage:[UIImage imageNamed:@"sleep"] forState:UIControlStateNormal];
//    }
    
}

-(void)blackOutTheBackgroundWithRespectToButton:(UIButton*)button{
    if ( nil == blackView) {
        blackView = [[UIView alloc]initWithFrame:self.view.frame];
        [blackView setBackgroundColor:[UIColor blackColor]];
        blackView.alpha = 0.2;
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tappedOnBlackOutBackground)];
        [blackView addGestureRecognizer:gesture];
    }

    [self.view addSubview:blackView];
    [self.view bringSubviewToFront:button];
}

-(void)tappedOnBlackOutBackground{
    
    if (selectedButton==self.poopButton) {
        [self poopButtonPressed:selectedButton];
    } else if (selectedButton==self.feedButton) {
        [self feedButtonPressed:selectedButton];
    }
    
    [blackView removeFromSuperview];
}

-(void)removeTheBlackOutBackground{
    [blackView removeFromSuperview];
}


#pragma mark - Configuring the view’s layout behavior

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - ICSDrawerControllerPresenting

- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

#pragma mark - Open drawer button

- (void)openDrawer:(id)sender
{
    [self.drawer open];
}

#pragma mark - radial menu delegate methods
- (NSInteger) numberOfItemsInRadialMenu:(ALRadialMenu *)radialMenu {
    //FIXME: dipshit, change one of these variable names
    if (radialMenu == self.radialMenu)
        return 2;
    else if (radialMenu == self.radialFeedMenu)
        return 2;
    
    return 0;
}


- (NSInteger) arcSizeForRadialMenu:(ALRadialMenu *)radialMenu {
        return 360;
    
}


- (NSInteger) arcRadiusForRadialMenu:(ALRadialMenu *)radialMenu {
    //    if (radialMenu == self.radialMenu)
    return 100;
    
}


- (ALRadialButton *) radialMenu:(ALRadialMenu *)radialMenu buttonForIndex:(NSInteger)index {
    ALRadialButton *button = [[ALRadialButton alloc] init];
    if (radialMenu == self.radialMenu) {
        if (index == 1) {
            [button setImage:[UIImage imageNamed:@"poop"] forState:UIControlStateNormal];
        } else if (index == 2) {
            [button setImage:[UIImage imageNamed:@"pee"] forState:UIControlStateNormal];
        } else if (index == 3) {
            [button setImage:[UIImage imageNamed:@"3"] forState:UIControlStateNormal];
        } else if (index == 4) {
            [button setImage:[UIImage imageNamed:@"4"] forState:UIControlStateNormal];
        } else if (index == 5) {
            [button setImage:[UIImage imageNamed:@"t1"] forState:UIControlStateNormal];
        } else if (index == 6) {
            [button setImage:[UIImage imageNamed:@"t2"] forState:UIControlStateNormal];
        } else if (index == 7) {
            [button setImage:[UIImage imageNamed:@"t3"] forState:UIControlStateNormal];
        } else if (index == 8) {
            [button setImage:[UIImage imageNamed:@"t4"] forState:UIControlStateNormal];
        }

    } else if(radialMenu == self.radialFeedMenu){
        if (index == 1) {
            [button setImage:[UIImage imageNamed:@"breastFeed"] forState:UIControlStateNormal];
        } else if (index == 2) {
            [button setImage:[UIImage imageNamed:@"formula"] forState:UIControlStateNormal];
        }
    }
    
    if (button.imageView.image) {
        return button;
    }
    
    return nil;
}


- (float) buttonSizeForRadialMenu:(ALRadialMenu *)radialMenu{
    return 60.0;
}

- (void) radialMenu:(ALRadialMenu *)radialMenu didSelectItemAtIndex:(NSInteger)index {
    
    NSLog(@"%ld", (long)index);
    if (radialMenu == self.radialMenu) {
        ALRadialButton *button = [radialMenu.items objectAtIndex:index-1];
        if(button.selected ==0){
            if(index<=4){
                self.selectedColorIndex = index;
                for (int i=1; i<=4; i++) {
                    [self removeSelectedImageFromButton:[radialMenu.items objectAtIndex:i-1]];
                }
            } else{
                self.selectedTextureIndex = index;
                for (int i=5; i<=8; i++) {
                    [self removeSelectedImageFromButton:[radialMenu.items objectAtIndex:i-1]];
                }
            }
            [self addSelectedImageFromButton:button];
        } else
            [self removeSelectedImageFromButton:button];
        if(index<=4){
            self.selectedColorIndex = 0;
        } else{
            self.selectedTextureIndex = 0;
        }
        
    }
    NSLog(@"%ld %ld", (long)self.selectedTextureIndex, (long)self.selectedColorIndex);
    
}


-(void)removeSelectedImageFromButton:(ALRadialButton*)button{
    button.selected = 0;
    for(UIView *view in button.subviews)
        if(view.tag==100)
            [view removeFromSuperview];
}

-(void)addSelectedImageFromButton:(ALRadialButton*)button{
    button.selected = 1;
    UIImageView *tickImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"circle"]];
    tickImageView.tag = 100;
    [button addSubview:tickImageView];
    
}

@end





/// REFERENCE

//    PoopTypeSelectionView *controller = [[[NSBundle mainBundle] loadNibNamed:@"PoopTypeSelectionView" owner:self options:nil] objectAtIndex:0];
//    PoopTypeSelectionView *controller = [[PoopTypeSelectionView alloc] init];
//    controller.backgroundColor = [UIColor clearColor];
//    controller.backgroundColor = [UIColor blackColor];
//    controller.frame = CGRectMake(0 , 0 , 375, 667);
//    controller.alpha = 0;
//    [self.view addSubview:controller];
//    [UIView animateWithDuration:0.5 animations:^{
//
//        controller.alpha = 1.0;
//    }];



//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 400, 600)];
//    label.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:label];

//    popover = [[FPPopoverController alloc] initWithViewController:controller];
//    popover.tint = FPPopoverWhiteTint;
//    popover.arrowDirection = FPPopoverNoArrow;
//    popover.contentSize = CGSizeMake(200, 300);
//    [popover presentPopoverFromPoint: CGPointMake(self.view.center.x, self.view.center.y - popover.contentSize.height/2)];

//    [self changePoopButtonStateImage];
//    [self.radialMenu buttonsWillAnimateFromButton:sender withFrame:self.poopButton.frame inView:self.view];

//    PoopTypeSelectionView *controller = [[PoopTypeSelectionView alloc] init];
//    UIView *controller = [[UIView alloc] init];
//    controller.backgroundColor = [UIColor yellowColor];
//    controller.frame = CGRectMake(0, 0, 400, 600);
//    controller.alpha = 0.0;
//    [self.view addSubview:controller];
//    [UIView animateWithDuration:0.5 animations:^{
//
//        controller.alpha = 1.0;
//    }];

