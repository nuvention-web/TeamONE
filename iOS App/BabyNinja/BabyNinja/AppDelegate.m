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

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor blackColor];
    
    self.window.rootViewController = [self addSideViewController];
    [self.window makeKeyAndVisible];
    return YES;    
}

// instantiates the sidecontroller and main controller with the library ICSDrawerController
-(UIViewController*)addSideViewController{
    NSArray *colors ;
    colors = @[[UIColor colorWithRed:237.0f/255.0f green:195.0f/255.0f blue:0.0f/255.0f alpha:1.0f],
                        [UIColor colorWithRed:237.0f/255.0f green:147.0f/255.0f blue:0.0f/255.0f alpha:1.0f],
                        [UIColor colorWithRed:237.0f/255.0f green:9.0f/255.0f blue:0.0f/255.0f alpha:1.0f]
                        ];
    
    LeftSideController *colorsVC = [[LeftSideController alloc] initWithColors:colors];
    MainViewController *plainColorVC = [[MainViewController alloc] init];
    plainColorVC.view.backgroundColor = colors[0];
    
    ICSDrawerController *drawer = [[ICSDrawerController alloc] initWithLeftViewController:colorsVC
                                                                     centerViewController:plainColorVC];
    return drawer;
}


- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void (^)(NSDictionary *))reply{
    
    if ([[userInfo objectForKey:@"request"] isEqualToString:@"Hello"]) {
        
        NSLog(@"containing app received message from watch");
        
        NSDictionary *response = @{@"response" : @"BabyNinja iphone is talking to Apple watch"};
        reply(response);
    }
    
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
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
