//
//  ViewController.m
//  BabyNinja
//
//  Created by Sneha on 1/29/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "MainViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface MainViewController (){
    UIView *blackView;
}

@property(nonatomic, strong) UIButton *openDrawerButton;

@property (nonatomic) NSInteger selectedColorIndex;
@property (nonatomic) NSInteger selectedTextureIndex;

@end


@implementation MainViewController

#pragma mark - Managing the view

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Initialize and add the openDrawerButton
    UIImage *hamburger = [UIImage imageNamed:@"hamburger"];
    NSParameterAssert(hamburger);
    
    // create the left slider button
    self.openDrawerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.openDrawerButton.frame = CGRectMake(10.0f, 20.0f, 44.0f, 44.0f);
    [self.openDrawerButton setImage:hamburger forState:UIControlStateNormal];
    [self.openDrawerButton addTarget:self action:@selector(openDrawer:) forControlEvents:UIControlEventTouchUpInside];
    
    //create an instance of the radial menu and set ourselves as the delegate.
    self.radialMenu = [[ALRadialMenu alloc] init];
    self.radialMenu.delegate = self;
    
    self.radialFeedMenu = [[ALRadialMenu alloc] init];
    self.radialFeedMenu.delegate = self;
    [self.view addSubview:self.openDrawerButton];
}

- (IBAction)poopButtonPressed:(id)sender {
    
    [self changePoopButtonStateImage];
    [self.radialMenu buttonsWillAnimateFromButton:sender withFrame:self.poopButton.frame inView:self.view];
}

-(void)changePoopButtonStateImage{
    if(self.poopButton.tag==0){
        self.poopButton.tag = 1 ; //setting the mode to selected
//        [self blackOutTheBackground];
        [self.poopButton setImage:[UIImage imageNamed:@"greenTick"] forState:UIControlStateNormal];
    } else {
        self.poopButton.tag = 0 ; //setting the mode to unselected
//        [self removeTheBlackOutBackground];
        [self.poopButton setImage:[UIImage imageNamed:@"diaper"] forState:UIControlStateNormal];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Diaper Alert!" message:@"You are left with just 8 diapers. Order more!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
}

- (IBAction)feedButtonPressed:(id)sender {
    [self changeFeedButtonStateImage];
    [self.radialFeedMenu buttonsWillAnimateFromButton:sender withFrame:self.feedButton.frame inView:self.view];

}

-(void)changeFeedButtonStateImage{
    if(self.feedButton.tag==0){
        self.feedButton.tag = 1 ; //setting the mode to selected
        [self.feedButton setImage:[UIImage imageNamed:@"greenTick"] forState:UIControlStateNormal];
    } else {
        self.feedButton.tag = 0 ; //setting the mode to unselected
        [self.feedButton setImage:[UIImage imageNamed:@"bottle"] forState:UIControlStateNormal];
    }
}

- (IBAction)sleepOrAwakeButtonPressed:(id)sender {
    if(self.sleepOrAwakeButton.tag==0){
        self.sleepOrAwakeButton.tag = 1 ; //setting the mode to selected
        [self.sleepOrAwakeButton setImage:[UIImage imageNamed:@"awake"] forState:UIControlStateNormal];
    } else {
        self.sleepOrAwakeButton.tag = 0 ; //setting the mode to unselected
        [self.sleepOrAwakeButton setImage:[UIImage imageNamed:@"sleep"] forState:UIControlStateNormal];
    }
    
}

-(void)blackOutTheBackground{
    if ( nil == blackView) {
        blackView = [[UIView alloc]initWithFrame:self.view.frame];
        [blackView setBackgroundColor:[UIColor blackColor]];
        blackView.alpha = 0.2;
    }

    [self.view addSubview:blackView];
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
        return 8;
    else if (radialMenu == self.radialFeedMenu)
        return 2;
    
    return 0;
}


- (NSInteger) arcSizeForRadialMenu:(ALRadialMenu *)radialMenu {
        return 360;
    
}


- (NSInteger) arcRadiusForRadialMenu:(ALRadialMenu *)radialMenu {
    //    if (radialMenu == self.radialMenu)
    return 80;
    
}


- (ALRadialButton *) radialMenu:(ALRadialMenu *)radialMenu buttonForIndex:(NSInteger)index {
    ALRadialButton *button = [[ALRadialButton alloc] init];
    if (radialMenu == self.radialMenu) {
        if (index == 1) {
            [button setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
        } else if (index == 2) {
            [button setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
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
    return 40.0;
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