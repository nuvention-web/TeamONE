//
//  ViewController.m
//  BabyNinja
//
//  Created by Sneha on 1/29/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "MainViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface MainViewController ()

@property(nonatomic, strong) UIButton *openDrawerButton;

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
    
    [self.view addSubview:self.openDrawerButton];
}

- (IBAction)poopButtonPressed:(id)sender {
    [self.radialMenu buttonsWillAnimateFromButton:sender withFrame:self.poopButton.frame inView:self.view];
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
        return 9;

    
    return 0;
}


- (NSInteger) arcSizeForRadialMenu:(ALRadialMenu *)radialMenu {
    if (radialMenu == self.radialMenu)
        return 360;
    
    return 0;
}


- (NSInteger) arcRadiusForRadialMenu:(ALRadialMenu *)radialMenu {
//    if (radialMenu == self.radialMenu)
        return 150;

}


- (ALRadialButton *) radialMenu:(ALRadialMenu *)radialMenu buttonForIndex:(NSInteger)index {
    ALRadialButton *button = [[ALRadialButton alloc] init];
    if (radialMenu == self.radialMenu) {
        if (index == 1) {
            [button setImage:[UIImage imageNamed:@"dribbble"] forState:UIControlStateNormal];
        } else if (index == 2) {
            [button setImage:[UIImage imageNamed:@"youtube"] forState:UIControlStateNormal];
        } else if (index == 3) {
            [button setImage:[UIImage imageNamed:@"vimeo"] forState:UIControlStateNormal];
        } else if (index == 4) {
            [button setImage:[UIImage imageNamed:@"pinterest"] forState:UIControlStateNormal];
        } else if (index == 5) {
            [button setImage:[UIImage imageNamed:@"twitter"] forState:UIControlStateNormal];
        } else if (index == 6) {
            [button setImage:[UIImage imageNamed:@"instagram500"] forState:UIControlStateNormal];
        } else if (index == 7) {
            [button setImage:[UIImage imageNamed:@"email"] forState:UIControlStateNormal];
        } else if (index == 8) {
            [button setImage:[UIImage imageNamed:@"googleplus-revised"] forState:UIControlStateNormal];
        } else if (index == 9) {
            [button setImage:[UIImage imageNamed:@"facebook500"] forState:UIControlStateNormal];
        }
        
    }
    
    if (button.imageView.image) {
        return button;
    }
    
    return nil;
}


- (void) radialMenu:(ALRadialMenu *)radialMenu didSelectItemAtIndex:(NSInteger)index {
    if (radialMenu == self.radialMenu) {
        [self.radialMenu itemsWillDisapearIntoButton:self.poopButton];
    }
    
}

@end