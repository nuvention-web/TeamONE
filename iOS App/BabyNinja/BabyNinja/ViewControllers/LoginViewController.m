//
//  LoginViewController.m
//  BabyNinja
//
//  Created by Sneha on 4/14/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "LoginViewController.h"
#import "ICSDrawerController.h"
#import "MainViewController.h"
#import "LeftSideController.h"
#import <Parse/Parse.h>
#import "BabyVitalsViewController.h"

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    
//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    testObject[@"foo"] = @"bar";
//    [testObject saveInBackground];
//    
    self.loginFBButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    self.loginFBButton.delegate = self;
//    self.loginFBButton.loginBehavior = FBSDKLoginBehaviorSystemAccount;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(profileUpdated:) name:FBSDKProfileDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logoutButtonPressed:) name:ULogoutNotification object:nil];
    if ([FBSDKAccessToken currentAccessToken]) {
        // User is logged in, do work such as go to next view controller.
    }
}

-(void)viewDidAppear:(BOOL)animated{
    if ([FBSDKAccessToken currentAccessToken]) {
//        [self presentViewController:[self addSideViewController] animated:NO completion:nil];
        [self showBabyVitalsScreen];
///        NSLog(@"%@", [PFUser currentUser]);
        // User is logged in, do work such as go to next view controller.
    }
}

-(void)profileUpdated:(NSNotification *) notification{
    NSLog(@"User name: %@",[FBSDKProfile currentProfile].name);
    NSLog(@"User ID: %@",[FBSDKProfile currentProfile].userID);
//    [PFUser currentUser].username =
}

-(UIViewController*)addSideViewController{
    NSArray *colors ;
    //    colors = @[[UIColor colorWithRed:237.0f/255.0f green:195.0f/255.0f blue:0.0f/255.0f alpha:1.0f],
    //                        [UIColor colorWithRed:237.0f/255.0f green:147.0f/255.0f blue:0.0f/255.0f alpha:1.0f],
    //                        [UIColor colorWithRed:237.0f/255.0f green:9.0f/255.0f blue:0.0f/255.0f alpha:1.0f]
    //                        ];
    colors = @[[UIColor clearColor],
               [UIColor clearColor],
               [UIColor clearColor]
               ];
    
    LeftSideController *colorsVC = [[LeftSideController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:colorsVC];
    MainViewController *plainColorVC = [[MainViewController alloc] init];
    plainColorVC.view.backgroundColor = colors[0];
    UINavigationController *navController1 = [[UINavigationController alloc]initWithRootViewController:plainColorVC];
    navController1.navigationBar.barStyle = UIBarStyleBlackOpaque;
    navController.title = @"BABYNINJA";
    ICSDrawerController *drawer = [[ICSDrawerController alloc] initWithLeftViewController:navController centerViewController:navController1];
    return drawer;
}

- (IBAction)logoutButtonPressed:(id)sender {
    NSLog(@"Logged out of facebook");
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [storage cookies])
    {
        NSString* domainName = [cookie domain];
        NSRange domainRange = [domainName rangeOfString:@"facebook"];
        if(domainRange.length > 0)
        {
            [storage deleteCookie:cookie];
        }
    }
    [[Utility sharedUtility] saveUserDefaultObject:[NSNumber numberWithBool:NO] forKey:UDefaultLoggedIn];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark FBSDKLoginButtonDelegate methods

- (void)loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                error:(NSError *)error{
    
    if(error == nil){
        [[Utility sharedUtility] saveUserDefaultObject:[NSNumber numberWithBool:YES] forKey:UDefaultLoggedIn];
//        [self presentViewController:[self addSideViewController] animated:NO completion:nil];
        [self showBabyVitalsScreen];
    }
}

-(void)showBabyVitalsScreen{
    CareTaker *careTaker = [[CareTaker alloc]init];
    careTaker.careTakerName = [FBSDKProfile currentProfile].name;
    careTaker.careTakerId = [FBSDKProfile currentProfile].userID;
//    careTaker.careTakerGender = [FBSDKProfile currentProfile]
    BabyVitalsViewController *controller = [[BabyVitalsViewController alloc]initWithCareGiver:careTaker];
    [self presentViewController:controller animated:NO completion:nil];
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton{
    
}


@end
