//
//  SubclassConfigViewController.m
//  LogInAndSignUpDemo
//
//  Created by Mattieu Gamache-Asselin on 6/15/12.
//  Copyright (c) 2013 Parse. All rights reserved.
//

#import "SubclassConfigViewController.h"
#import "LoginViewController.h"
#import "SignUpViewController.h"
#import "MainViewController.h"
#import "LeftSideController.h"
#import "BabyVitalsViewController.h"

@implementation SubclassConfigViewController{
    NSString *newUserEmail;
    
}


#pragma mark - UIViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self hideEverything:YES];


    
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([PFUser currentUser]) {
        //self.welcomeLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Welcome %@!", nil), [[PFUser currentUser] username]];
        NSLog(@"%@",[PFUser currentUser].objectId);
        
        PFQuery *query = [PFQuery queryWithClassName:@"CareTaker"];
        [query whereKey:@"careTakerId" equalTo:[PFUser currentUser].objectId];
        [query includeKey:@"careTakerBabyArray"];
        [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
            
                // The find succeeded.
                
                NSLog(@"the object%@",object);
                //                if(object == nil)
                //                    [self showBabyVitalsScreen];
                //                else
                {
                    
                    // intialize care Taker
                    CareTaker *careTaker = (CareTaker *)object ;//[[CareTaker alloc]init];
                    //                careTaker = object;
                    // NSLog(@"care taker name %@",careTaker.careTakerName);
                    
                    
                    // intialize the baby
                    Baby *baby = [[Baby alloc]init];
                    
                    baby = careTaker.careTakerBabyArray[0];
                    
                    
                    
                    [self presentViewController:[self addSideViewController:careTaker] animated:YES completion:nil];
                    
                    NSLog(@"Successfully retrieved %@",baby.babyName);
                
            }
        }];
        
    } else {
        self.welcomeLabel.text = NSLocalizedString(@"Not logged in", nil);
    }
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

-(void)hideEverything:(BOOL)hide{
    for(UIView *view in [self.view subviews]){
        [view setHidden:hide];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Check if user is logged in
    if (![PFUser currentUser]) {        
        [self presentLoginScreen];
    } else {
//        [self.navigationController pushViewController:[self addSideViewController] animated:YES];
    }
//    [self hideEverything:NO];
}



-(void)presentLoginScreen{
    // Customize the Log In View Controller
    LoginViewController *logInViewController = [[LoginViewController alloc] init];
    logInViewController.delegate = self;
    logInViewController.facebookPermissions = @[@"friends_about_me"];
    logInViewController.fields = PFLogInFieldsUsernameAndPassword | PFLogInFieldsTwitter | PFLogInFieldsFacebook | PFLogInFieldsSignUpButton | PFLogInFieldsDismissButton;
    
    // Customize the Sign Up View Controller
    SignUpViewController *signUpViewController = [[SignUpViewController alloc] init];
    signUpViewController.delegate = self;
    signUpViewController.fields = PFSignUpFieldsDefault | PFSignUpFieldsAdditional;
    logInViewController.signUpController = signUpViewController;
    
    // Present Log In View Controller
    [self presentViewController:logInViewController animated:NO completion:NULL];
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


#pragma mark - PFLogInViewControllerDelegate

// Sent to the delegate to determine whether the log in request should be submitted to the server.
- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
    
    if (username && password && username.length && password.length) {
        return YES;
    }
    
    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Make sure you fill out all of the information!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
    return NO;
}

// Sent to the delegate when a PFUser is logged in.
- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    [self addSideViewController];
}

-(void)showBabyVitalsScreen{
    CareTaker *careTaker = [[CareTaker alloc]init];
    careTaker.careTakerName = [FBSDKProfile currentProfile].name;
    careTaker.careTakerId = [FBSDKProfile currentProfile].userID;
    //    careTaker.careTakerGender = [FBSDKProfile currentProfile]
    BabyVitalsViewController *controller = [[BabyVitalsViewController alloc]initWithCareGiver:careTaker];
    [self presentViewController:controller animated:NO completion:nil];
}

// Sent to the delegate when the log in attempt fails.
- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
    NSLog(@"Failed to log in...");
}

// Sent to the delegate when the log in screen is dismissed.
- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    NSLog(@"User dismissed the logInViewController");
}


#pragma mark - PFSignUpViewControllerDelegate

// Sent to the delegate to determine whether the sign up request should be submitted to the server.
- (BOOL)signUpViewController:(PFSignUpViewController *)signUpController shouldBeginSignUp:(NSDictionary *)info {
    BOOL informationComplete = YES;
    for (id key in info) {
        NSString *field = [info objectForKey:key];
        if (!field || field.length == 0) {
            informationComplete = NO;
            break;
        }
    }
    
    if (!informationComplete) {
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information thai", nil) message:NSLocalizedString(@"Make sure you fill out all of the information!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
    }else{
        
        
        
    }

//    NSLog(@"Dictionary tester: %@", info   );
    newUserEmail = [[NSString alloc] initWithString:info[@"username"]];
    
//CareTaker *newCareTaker = [[CareTaker alloc] init];
//    newCareTaker
    
    
    //return informationComplete;
    return YES;
}

// Sent to the delegate when a PFUser is signed up.



- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:NULL];
     CareTaker *sendCareTaker = [[CareTaker alloc] init];
 
    //////////////// CRAP CODE ////////////////
    PFQuery *query = [PFUser query];
    NSArray *girls = [query findObjects];
    
    for (int i = 0; i <  girls.count; i++){
        PFObject *myObject = girls[i];
//        NSLog(@" SHOW searcher: %@",  myObject[@"username"]);
//        NSLog(@" SHOW searcher: %@",  myObject.objectId);
        
        if([newUserEmail isEqualToString:myObject[@"username"]]){
            sendCareTaker.careTakerId = myObject.objectId;
        }
        
        
    }
    


    BabyVitalsViewController *controller = [[BabyVitalsViewController alloc]initWithCareGiver:sendCareTaker];
    [self presentViewController:controller animated:NO completion:nil];

}



// Sent to the delegate when the sign up attempt fails.
- (void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error {
    NSLog(@"Failed to sign up...");
}

// Sent to the delegate when the sign up screen is dismissed.
- (void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController {
    NSLog(@"User dismissed the signUpViewController");
}




#pragma mark - ()

- (IBAction)logOutButtonTapAction:(id)sender {
    [PFUser logOut];
    [self.navigationController popViewControllerAnimated:YES];
    [self presentLoginScreen];
}

@end
