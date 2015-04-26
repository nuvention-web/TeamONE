//
//  BabyVitalsViewController.m
//  BabyNinja
//
//  Created by Sneha on 4/25/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "BabyVitalsViewController.h"
#import "ICSDrawerController.h"
#import "MainViewController.h"
#import "LeftSideController.h"

@interface BabyVitalsViewController (){
    BOOL didSetDOB;
    Baby *makeBabyObject;
}

@end

@implementation BabyVitalsViewController

-(id)initWithCareGiver:(CareTaker*)careTaker{
    self = [super init];
    if(self){
        self.careTaker = careTaker;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    makeBabyObject = [[Baby alloc] init];
    makeBabyObject.activities = [[NSMutableArray alloc] init];
    didSetDOB = NO;
    
    [self.careTaker.careTakerBabyArray addObject:makeBabyObject];
    
    self.nextScreenButton.enabled = NO;
    self.babyNameTextField.delegate = self;
    self.babyWeightTextField.delegate = self;
    
    // Do any additional setup after loading the view from its nib.
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.babyImageView.layer.cornerRadius = 90;
    self.babyImageView.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)genderSegmentControlChanged:(id)sender {
}

- (IBAction)imageEditButtonPressed:(id)sender {
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Edit Photo"
                                          message:@""
                                          preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *takePhotoAction = [UIAlertAction actionWithTitle:@"Take Photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UIImagePickerController *imagePickController = [[UIImagePickerController alloc]init];
        imagePickController.sourceType = UIImagePickerControllerSourceTypeCamera;
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
            imagePickController.delegate=self;
            imagePickController.allowsEditing=TRUE;
            [self presentViewController:imagePickController animated:YES completion:nil];
 
        }
    }] ;
    UIAlertAction *choosePhotoAction = [UIAlertAction actionWithTitle:@"Choose Existing Photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UIImagePickerController *imagePickController = [[UIImagePickerController alloc]init];
        imagePickController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
            imagePickController.delegate=self;
            imagePickController.allowsEditing=TRUE;
            [self presentViewController:imagePickController animated:YES completion:nil];
            
        }
    }] ;
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        // do stuff here
    }] ;
    [alertController addAction:takePhotoAction];
    [alertController addAction:choosePhotoAction];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

//****************
// GOOD TO GO BUTTON
- (IBAction)nextScreenButtonPressed:(id)sender {
    
    NSNumberFormatter *formatNumber = [[NSNumberFormatter alloc] init];
    formatNumber.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *babyWeight = [formatNumber numberFromString:self.babyWeightTextField.text];
    makeBabyObject.babyName =  self.babyNameTextField.text;
    makeBabyObject.babyWeight = babyWeight;
    makeBabyObject.babyId = @"SOME BABY ID";           // Modify this section to someID
    
    if(self.genderSegmentControl.selectedSegmentIndex == 0)
    {
        makeBabyObject.babyGender = @"MALE";
    }else{
        makeBabyObject.babyGender = @"FEMALE";
        
    }
    
    
    
    [self presentViewController:[self addSideViewController] animated:YES completion:nil];
    [makeBabyObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"BABY OBJECT MADE");
        } else {
            NSLog(@"NOT DONE");        }
    }];
}





- (IBAction)babyDOBButtonPressed:(id)sender {
    
    if(self.babyDOBButton.tag == 0){
        [self showDatePicker];
        
    } else {
        [self hideDatePicker];
        
    }
}

-(void)showDatePicker{
    self.nextScreenButton.alpha = 0;
    self.babyDOBButton.tag = 1;
    [UIView animateWithDuration:0.5f
                     animations:^{
                         [self.datePickerView setFrame:CGRectMake(self.datePickerView.frame.origin.x,
                                                         410,
                                                         self.datePickerView.frame.size.width,
                                                         self.datePickerView.frame.size.height)];
                     }
                     completion:nil];
}

-(void)hideDatePicker{
    [UIView animateWithDuration:0.5f
                     animations:^{
                         [self.datePickerView setFrame:CGRectMake(self.datePickerView.frame.origin.x,
                                                              667,
                                                              self.datePickerView.frame.size.width,
                                                              self.datePickerView.frame.size.height)];
                     }
                     completion:nil];
    self.babyDOBButton.tag = 0;
    self.nextScreenButton.alpha = 1;
}


- (IBAction)doneButtonPressed:(id)sender {
    didSetDOB = YES;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    NSString *string = [dateFormatter stringFromDate:self.datePicker.date];
    
    // set the Baby Birth Day
    makeBabyObject.babyDOB = self.datePicker.date;
    
    [self.babyDOBButton setTitle:string forState:UIControlStateNormal];
    [self hideDatePicker];
    [self validateDataEntries];
    NSLog(@"but button is pressed");
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
    
    LeftSideController *colorsVC = [[LeftSideController alloc] initWithCareTaker:self.careTaker];
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:colorsVC];
    MainViewController *plainColorVC = [[MainViewController alloc] initWithCareTaker:self.careTaker];
    
    // NEW CODE ADDED FOR IF WE DECIDE TO SEND OBJECT FROM VIEW CONTROLLERS
    
    plainColorVC.view.backgroundColor = colors[0];
    UINavigationController *navController1 = [[UINavigationController alloc]initWithRootViewController:plainColorVC];
    navController1.navigationBar.barStyle = UIBarStyleBlackOpaque;
    navController.title = @"BABYNINJA";
    ICSDrawerController *drawer = [[ICSDrawerController alloc] initWithLeftViewController:navController centerViewController:navController1];
    return drawer;
    
    
    
    
}




-(void)validateDataEntries{
    if(![self.babyNameTextField.text isEqualToString:@""] && ![self.babyWeightTextField.text isEqualToString:@""] && didSetDOB){
        self.nextScreenButton.enabled = YES;
    }
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [self hideDatePicker];
//    if(textField == self.babyDOBTextField){
//        [self showDatePicker];
//        return NO;
//    } else {
        return YES;
//    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    return YES;
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    [self validateDataEntries];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    return YES;
    
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    
    return YES;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self.babyWeightTextField resignFirstResponder];
    [self.babyNameTextField resignFirstResponder];
    return YES;
}

#pragma mark UIImagePickerControllerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image=[info objectForKey:UIImagePickerControllerEditedImage];
    self.babyImageView.image=image;
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
