//
//  AppDelegate.m
//  BabyNinja
//
//  Created by Sneha on 1/29/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "AppDelegate.h"
#import "ICSDrawerController.h"
#import "MainViewController.h"
#import "LeftSideController.h"
#import <Parse/Parse.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
//#import <FacebookSDK/FacebookSDK.h>
#import "LoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
// cameron testing

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Parse setApplicationId:@"0iY4J5cRhjyh2vwkMcfLlQCTnalQ4JdNTtGyAlkg"
                  clientKey:@"Gkj3LuUho7ejgdHjls0nVEZXkeqM83aKCdAvKTmd"];
    
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    [FBSDKLoginButton class];
//    [FBSDKLoginView class];
    [FBSDKProfilePictureView class];
    [FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
    
    LoginViewController *login = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor blackColor];
    
//    if([[NSUserDefaults standardUserDefaults] boolForKey:UDefaultLoggedIn] == NO)
        self.window.rootViewController = login;
//    else
//        self.window.rootViewController = [self addSideViewController];
    
    [self.window makeKeyAndVisible];
    [self initiateUserDefaultVarialbles]; //dirty way for demonstration -- SA
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                    didFinishLaunchingWithOptions:launchOptions];
}

-(void)initiateUserDefaultVarialbles{
    NSUserDefaults *d = [NSUserDefaults standardUserDefaults];
    NSString *key = @"DiaperCount";
    [d setInteger:12 forKey:key];
}

// instantiates the sidecontroller and main controller with the library ICSDrawerController
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


- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void (^)(NSDictionary *))reply{
    
    if ([[userInfo objectForKey:@"diaper"] isEqualToString:@"changed"]) {
        
        NSLog(@"containing app received message from watch");
        
        NSUserDefaults *d = [NSUserDefaults standardUserDefaults];
        NSString *key = @"DiaperCount";
        NSLog(@"%ld",(long)[d integerForKey:key]);
        
        [d setInteger:([d integerForKey:key]-1) forKey:key];
        
        NSLog(@"%ld",(long)[d integerForKey:key]);
        
        NSDictionary *response = @{@"newDiaperCount" :[NSNumber numberWithInt:(int)[d integerForKey:key]],@"minDiaperCount" :[NSNumber numberWithInt:(int)[d integerForKey:@"MinDiaperCount"]] };
        reply(response);
    }
    
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBSDKAppEvents activateApp];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
