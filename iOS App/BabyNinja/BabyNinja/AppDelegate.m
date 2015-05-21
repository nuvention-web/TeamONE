//
//  AppDelegate.m
//  BabyNinja
//
//  Created by Sneha on 1/29/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "AppDelegate.h"
#import "ICSDrawerController.h"

#import <Parse/Parse.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
//#import <FacebookSDK/FacebookSDK.h>
#import "LoginViewController.h"
#import "SubclassConfigViewController.h"

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
    
    SubclassConfigViewController *login = [[SubclassConfigViewController alloc]initWithNibName:@"SubclassConfigViewController" bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:login];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor blackColor];
    
    self.window.rootViewController = nav;
    
    [self.window makeKeyAndVisible];
    [self initiateUserDefaultVarialbles]; //dirty way for demonstration -- SA
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                    didFinishLaunchingWithOptions:launchOptions];
}

-(void)initiateUserDefaultVarialbles{
    
    [[Utility sharedUtility] saveUserDefaultObject:[NSNumber numberWithInt:12] forKey:DiaperCount];
   NSLog(@"%@",[[Utility sharedUtility] userDefaultForKey:DiaperCount]) ;
}



- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void (^)(NSDictionary *))reply{
    NSLog(@"***** %@", userInfo);
    NSLog(@"you are herE!!!");

    NSTimeInterval timeStamp = [[NSDate date] timeIntervalSince1970];
    NSNumber *timeStampObj = [NSNumber numberWithInt:timeStamp];
    
    Activity *sendActivity = [[Activity alloc] init];
    sendActivity.activityType =userInfo[@"activity"];
    sendActivity.timeStamp = timeStampObj;
    sendActivity.activityID = @"SOME ACTIVITY";
    
    Diapers *sendDiaperObject = [[Diapers alloc] init];
    
    sendDiaperObject.color = userInfo[@"color"];
    sendDiaperObject.poopTexture = userInfo[@"texture"];
    sendDiaperObject.type = userInfo[@"type"];
    sendDiaperObject.timeStamp = timeStampObj;
    sendActivity.diaperObject = sendDiaperObject;
    
    
    
   [sendActivity saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
         if (succeeded) {
              NSLog(@"DONE DONE");
            } else {
                NSLog(@"NOT DONE");
           }
    }];
  
//    BOOL res = [activityType isEqualToString:@"diaper"];
    
    
//    
//    NSString *activityType = userInfo[@"activity"];
//    BOOL res = [activityType isEqualToString:@"diaper"];
//    switch (res) {
//        case NSOrderedAscending:
//            // going up
//            break;
//        case NSOrderedSame:
//            // even steven
//            break;
//        case NSOrderedDescending:
//            // down i go
//            break;
//        default:
//            break;
//    }
//    
//    
    //    BOOL res = [activityType isEqualToString:@"diaper"];

    
//
//    
//    
//    
//    NSString *activityType = userInfo[@"activity"];
//    
//    BOOL res = [activityType isEqualToString:@"diaper"];
//    if(res){
//   
//    }
//    
//   
//    [sendActivity saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (succeeded) {
//            NSLog(@"DONE DONE");
//        } else {
//            NSLog(@"NOT DONE");
//        }
//    }];
//    
//    
//    
    
    

    
    if ([[userInfo objectForKey:@"activity"] isEqualToString:@"diaper"]) {
        
        NSLog(@"containing app received message from watch");
        [[NSNotificationCenter defaultCenter] postNotificationName:@"DiaperActivityFromWatch" object:userInfo];
        
        reply(nil);
    } else
        reply(nil);
    
    
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
