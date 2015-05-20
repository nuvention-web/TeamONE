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
    self.usernameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
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
//        PFQuery *query = [PFQuery queryWithClassName:@"CareTaker"];
//        [query whereKey:@"careTakerId" equalTo:[FBSDKProfile currentProfile].userID];
//        [query includeKey:@"careTakerBabyArray"];
//        [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
//            if (!object) {
//                NSLog(@"The getFirstObject request failed.");
//                [self showBabyVitalsScreen];
//                
//            } else {
//                // The find succeeded.
//                
//                // intialize care Taker
//                CareTaker *careTaker = [[CareTaker alloc]init];
//                careTaker = object;
//                // NSLog(@"care taker name %@",careTaker.careTakerName);
//                
//                
//                // intialize the baby
//                Baby *baby = [[Baby alloc]init];
//                
//                baby = careTaker.careTakerBabyArray[0];
//                
//                
//                
//                [self presentViewController:[self addSideViewController:careTaker] animated:YES completion:nil];
//                
//                NSLog(@"Successfully retrieved %@",baby.babyName);
//            }
//        }];
        
        
///        NSLog(@"%@", [PFUser currentUser]);
        // User is logged in, do work such as go to next view controller.
    }
    
   // [self showBabyVitalsScreen];
}

-(void)profileUpdated:(NSNotification *) notification{
    NSLog(@"User name: %@",[FBSDKProfile currentProfile].name);
    NSLog(@"User ID: %@",[FBSDKProfile currentProfile].userID);
//    [PFUser currentUser].username =
    PFQuery *query = [PFQuery queryWithClassName:@"CareTaker"];
    [query whereKey:@"careTakerId" equalTo:[FBSDKProfile currentProfile].userID];
    [query includeKey:@"careTakerBabyArray"];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        if (!object) {
            [self showBabyVitalsScreen];
            NSLog(@"The getFirstObject request failed.");
            
        } else {
            // The find succeeded.
            
            NSLog(@"the object%@",object);
            //                if(object == nil)
            //                    [self showBabyVitalsScreen];
            //                else
            {
                
                // intialize care Taker
                CareTaker *careTaker = [[CareTaker alloc]init];
                careTaker = object;
                // NSLog(@"care taker name %@",careTaker.careTakerName);
                
                
                // intialize the baby
                Baby *baby = [[Baby alloc]init];
                
                baby = careTaker.careTakerBabyArray[0];
                
                
                
                [self presentViewController:[self addSideViewController:careTaker] animated:YES completion:nil];
                
                NSLog(@"Successfully retrieved %@",baby.babyName);
            }
        }
    }];
}

-(UIViewController*)addSideViewController:(CareTaker *)careTaker{
    NSArray *colors ;
    //    colors = @[[UIColor colorWithRed:237.0f/255.0f green:195.0f/255.0f blue:0.0f/255.0f alpha:1.0f],
    //                        [UIColor colorWithRed:237.0f/255.0f green:147.0f/255.0f blue:0.0f/255.0f alpha:1.0f],
    //                        [UIColor colorWithRed:237.0f/255.0f green:9.0f/255.0f blue:0.0f/255.0f alpha:1.0f]
    //                        ];
    colors = @[[UIColor clearColor],
               [UIColor clearColor],
               [UIColor clearColor]
               ];
    
    LeftSideController *colorsVC = [[LeftSideController alloc] initWithCareTaker:(careTaker)];
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:colorsVC];
    MainViewController *plainColorVC = [[MainViewController alloc] initWithCareTaker:(careTaker)];
    plainColorVC.view.backgroundColor = colors[0];
    UINavigationController *navController1 = [[UINavigationController alloc]initWithRootViewController:plainColorVC];
    navController1.navigationBar.barStyle = UIBarStyleBlackOpaque;
    navController.title = @"BABYNINJA";
    ICSDrawerController *drawer = [[ICSDrawerController alloc] initWithLeftViewController:navController centerViewController:navController1];
    return drawer;
}

- (IBAction)signInButtonPressed:(id)sender {
}

- (IBAction)signUpButtonPressed:(id)sender {
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

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if(textField == self.usernameTextField){
        [self.passwordTextField becomeFirstResponder];
        
    } else if (textField == self.passwordTextField){
        [self signInButtonPressed:nil];
    }
    
    return YES;
}

@end
