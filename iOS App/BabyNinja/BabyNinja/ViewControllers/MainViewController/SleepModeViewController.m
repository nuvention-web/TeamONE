//
//  SleepModeViewController.m
//  BabyNinja
//
//  Created by Sneha on 3/9/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "SleepModeViewController.h"

@interface SleepModeViewController (){
    Sleep *currentSleep;
    BOOL isSleep; // Sleep is 1; Nap is 0;
    Activity *sendActivity;
    
}
@property (strong,nonatomic) NSTimer* timer;
@property (strong, nonatomic) NSDate *startTime;
@end

@implementation SleepModeViewController


-(id)initWithBabyName:(NSString*)babyname{
    self = [super init];
    
    if(self){
        self.babyName = babyname;
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    sendActivity = [Activity returnActivityWithAttibutes:TYPE_SLEEP :@"SOME ID "];
    currentSleep = [[Sleep alloc] init];
    
    
    NSString *fullLabelwithBaby = [[NSString alloc] initWithFormat:@"Baby %@ has been sleeping since", self.babyName];
    self.sleepBabyLabel.text = fullLabelwithBaby;

    
    /// TO DEFINE IF SLEEP OR NAP
    isSleep = 0;
    
    
    self.startTime = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"hh:mm:ss a"];
    self.timeLabel.text =  [formatter stringFromDate:[NSDate date]];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                     target:self
                                   selector:@selector(updateTheTimeLabel)
                                   userInfo:nil
                                    repeats:YES];
    // Do any additional setup after loading the view from its nib.
    
    
    
    //COMMNETED COULD NEED THIS FOR LATER
    //NSLog(@"START: %@",    [NSDate date] );
    
    
}

-(void)updateTheTimeLabel{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"hh:mm:ss a"];
    NSDate *date = [NSDate date];
    NSTimeInterval timeInterval = [date timeIntervalSinceDate:self.startTime];
    //    NSLog(@"Current Date: %@", [formatter stringFromDate:[NSDate date]]);
    self.durationLabel.text = [self stringFromTimeInterval:timeInterval];
}

- (NSString *)stringFromTimeInterval:(NSTimeInterval)interval {
    NSInteger ti = (NSInteger)interval;
    NSInteger seconds = ti % 60;
    NSInteger minutes = (ti / 60) % 60;
    NSInteger hours = (ti / 3600);
    return [NSString stringWithFormat:@"%02ld:%02ld:%02ld", (long)hours, (long)minutes, (long)seconds];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)awakeButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    NSTimeInterval timeStamp = [[NSDate date] timeIntervalSince1970];
    NSNumber *timeStampObj = [NSNumber numberWithInt:timeStamp];
    
    
    if(isSleep){
        currentSleep.type = SLEEP_TYPE_SLEEP;
    }else{
        currentSleep.type = SLEEP_TYPE_NAP;
    }
    currentSleep.finishTime = timeStampObj;

    sendActivity.sleepObject = currentSleep;

    
    [self.delegate sleepRecorded:sendActivity];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
