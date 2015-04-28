//
//  FeedOuncesViewController.m
//  BabyNinja
//
//  Created by Sneha on 4/27/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "FeedOuncesViewController.h"

@interface FeedOuncesViewController (){
    Feed *feedObject;
}

@end

@implementation FeedOuncesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    
    feedObject = [[Feed alloc] init];
    
    
    
    
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)presetButtonSelected:(UIButton*)sender {
    self.ouncesLabel.text = [NSString stringWithFormat:@"%ld",sender.tag *5 + 5 ];
}

- (IBAction)okayButtonPressed:(id)sender {
    [self.delegate FeedOuncesRecorded:[Activity new]];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark UIPickerViewDelegate methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component==0){
        return [NSString stringWithFormat:@"%ld", row+1];
    }
    else
        return @"Ounces";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(component==0){
        self.ouncesLabel.text = [NSString stringWithFormat:@"%ld", row+1];
    }
}


#pragma mark UIPickerViewDataSource methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if(component==0)
        return 20;
    else
        return 1;
}

@end
