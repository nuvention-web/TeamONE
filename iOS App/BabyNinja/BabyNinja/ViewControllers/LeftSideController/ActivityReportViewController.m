//
//  SleepReportViewController.m
//  BabyNinja
//
//  Created by Sneha on 3/10/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//
#import "ActivityReportViewController.h"

// Views
#import "JBLineChartView.h"
#import "JBChartHeaderView.h"
#import "JBLineChartFooterView.h"
#import "JBChartInformationView.h"
#import "JBChartTooltipTipView.h"


#define ARC4RANDOM_MAX 0x100000000

typedef NS_ENUM(NSInteger, JBLineChartLine){
    JBLineChartLineSolid,
    JBLineChartLineDashed,
    JBLineChartLineCount
};

// Numerics
CGFloat const kJBLineChartViewControllerChartHeight = 250.0f;
CGFloat const kJBLineChartViewControllerChartPadding = 10.0f;
CGFloat const kJBLineChartViewControllerChartHeaderHeight = 75.0f;
CGFloat const kJBLineChartViewControllerChartHeaderPadding = 20.0f;
CGFloat const kJBLineChartViewControllerChartFooterHeight = 20.0f;
CGFloat const kJBLineChartViewControllerChartSolidLineWidth = 6.0f;
CGFloat const kJBLineChartViewControllerChartSolidLineDotRadius = 5.0f;
CGFloat const kJBLineChartViewControllerChartDashedLineWidth = 2.0f;
NSInteger const kJBLineChartViewControllerMaxNumChartPoints = 7;

// Strings
NSString * const kJBLineChartViewControllerNavButtonViewKey = @"view";

CGFloat const kJBBaseChartViewControllerAnimationDuration = 0.25f;

@interface  ActivityReportViewController () <JBLineChartViewDelegate, JBLineChartViewDataSource>
@property (nonatomic, strong) JBChartTooltipView *tooltipView;
@property (nonatomic, strong) JBChartTooltipTipView *tooltipTipView;
@property (nonatomic, strong) JBLineChartView *lineChartView;
@property (nonatomic, strong) JBChartInformationView *informationView;
@property (nonatomic, strong) NSArray *chartData;
@property (nonatomic, strong) NSArray *daysOfWeek;

// Buttons
- (void)chartToggleButtonPressed:(id)sender;

// Helpers
- (void)initFakeData;
- (NSArray *)largestLineData; // largest collection of fake line data

@end

@implementation ActivityReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view bringSubviewToFront:self.toolBar];
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
- (IBAction)closeButtonPressed:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


#pragma mark - Configuring the view’s layout behavior

- (UIStatusBarStyle)preferredStatusBarStyle
{
    // Even if this view controller hides the status bar, implementing this method is still needed to match the center view controller's
    // status bar style to avoid a flicker when the drawer is dragged and then left to open.
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

//
//  JBLineChartViewController.m
//  JBChartViewDemo
//
//  Created by Terry Worona on 11/5/13.
//  Copyright (c) 2013 Jawbone. All rights reserved.
//

#pragma mark - Alloc/Init

- (id)init
{
    self = [super init];
    if (self)
    {
        [self initFakeData];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self initFakeData];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        [self initFakeData];
    }
    return self;
}

-(id)initWithActitvityType:(NSString*)activityType{
    self = [super init];
    if (self)
    {
        self.activityType = activityType;
        [self initFakeData];
    }
    return self;
}

#pragma mark - Data

- (void)initFakeData
{
    NSMutableArray *counter = [NSMutableArray array];
    
    
    for (NSInteger i = 0; i < 7; i++)
        [counter addObject: [NSNumber numberWithInteger:1]];
    
    
    //__block int counter[7];  // Check how many poops today
    //counter[0]=2;
    
    NSUInteger limit = 1500;
    PFQuery *query;
    
    if ([self.activityType  isEqual: @"Diaper"])
    {   query=[PFQuery queryWithClassName:@"Activity"];
        [query whereKey:@"activityType" equalTo:@"Diaper"];
    }
    else if ([self.activityType isEqual: @"Feed"])
    {
        query=[PFQuery queryWithClassName:@"Activity"];
        [query whereKey:@"activityType" equalTo:@"Feed"];
        [query includeKey:@"feedObject"];
    }
    else if ([self.activityType isEqual: @"Sleep"])
    {
        query=[PFQuery queryWithClassName:@"Activity"];
        [query whereKey:@"activityType" equalTo:@"Sleep"];
        [query includeKey:@"sleepObject"];
    }
    

    

    
    //NSString *dateToday = [NSString stringWithFormat:@"%@",[NSDate date]];
    
    
    [query setLimit: limit];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
     {
         if (!error) {
             NSString *dates[7];
             
             NSDate *today = [NSDate date];
            /*
             NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
             [dateFormatter setDateFormat:@"EE"];
             NSLog(@"%@", [dateFormatter stringFromDate:today]);
             
             NSDate *last = [today dateByAddingTimeInterval: -(86400.0*6)];
             NSLog(@"%@", [dateFormatter stringFromDate:last]);*/
            

             
            // NSString * todayTimestamp = [NSString stringWithFormat:@"%d", (long)[[NSDate date] timeIntervalSince1970]];
             
             int todayTimestamp = [[NSDate date] timeIntervalSince1970];
             NSString * timeStampString =[NSString stringWithFormat:@"%d",todayTimestamp];
             NSTimeInterval _interval=[timeStampString doubleValue];
             
             NSDate *todayDate = [NSDate dateWithTimeIntervalSince1970:_interval];

             
    
            /* dates[0]=@"2015-04-21";
             dates[1]=@"2015-04-22";
             dates[2]=@"2015-04-23";
             dates[3]=@"2015-04-24";
             dates[4]=@"2015-04-25";
             dates[5]=@"2015-04-26";
             dates[6]=@"2015-04-27";*/
             
             NSMutableArray *count = [NSMutableArray array];
             
             NSMutableArray *dayweek = [NSMutableArray array];
             for (int j=0; j< 7; j++)
                 [dayweek setObject:@"" atIndexedSubscript:j];
             
             
             int d = 6;
             
             NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
             [dateFormatter setDateFormat:@"EE"];
             
             for (int j=0; j< 7; j++)
             {
                 NSDate *date = [todayDate dateByAddingTimeInterval: -(86400.0*j)];
                 NSDateFormatter *_formatter=[[NSDateFormatter alloc]init];
                 [_formatter setDateFormat:@"dd.MM.yyyy"];
                 
                 dates[d]=[_formatter stringFromDate:date];
                 
                 [dayweek setObject:[NSString stringWithString:[dateFormatter stringFromDate:date]] atIndexedSubscript:d];
                 
                // NSLog(dayweek[d]);
                 
                // _daysOfWeek
               //  NSLog(dates[d]);
                 d --;
                 [count setObject:[NSNumber numberWithInt:0] atIndexedSubscript:j];
                 
                 
             }//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
             
             //  NSDate *today = [NSDate date];
             
             
             
             
             
             
             NSUInteger x = 0;
             // NSLog(@"x: %d",x);
             int v =0;
             
             for (id element in objects){
                 
                 
                 
                 NSString *dateDB = [NSString stringWithFormat:@"%@", element[@"timeStamp"]];
                 
                 NSTimeInterval _interval=[dateDB doubleValue];
                 
                 NSDate *dbDate = [NSDate dateWithTimeIntervalSince1970:_interval];
                 
                 NSDateFormatter *_formatter=[[NSDateFormatter alloc]init];
                 [_formatter setDateFormat:@"dd.MM.yyyy"];

                // NSLog([_formatter stringFromDate:dbDate]);
                 
                 
                 
                for(int i=0;i<7;i++){
                   
                    
                     
                     
                     if([[_formatter stringFromDate:dbDate] isEqualToString:dates[i]] )  {
                         
                        /// NSLog(@"i: %d",i);
                         
                         int b;
                         
                         if ([self.activityType  isEqual: @"Diaper"])
                         {
                             
                             b = [[count objectAtIndex:i] intValue] +1;
                             [count replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:b]];
                         }
                         else if ([self.activityType isEqual: @"Feed"])
                         {

                             
                          
                            //[query includeKey:@"diaperObject"];
                             
                             //for (PFObject *object in objects) {
                            PFObject *object =  element;
                             
                                 PFObject *feed = [object objectForKey:@"feedObject"];
                                 
                                 NSLog(@"FEED   %@", feed[@"volume"]);
                             
                             
                                 //Diapers *diaper = [[Diapers alloc] init];
                                 //Activity *at = [[Activity alloc] init];
                                 //at = object;
                                 
                                 
                                 //                diaper = at.diaperObject;
                                 //                NSLog(@"Diaper   %@", diaper);
                                 //                NSLog(@"COLORRRR THIS I ITTI!@$!@$  %@", diaper.color);
                                 
                            // }
                             
                            //b = [[count objectAtIndex:i] intValue] + [element[@"volume"] integerValue];
                           /*  NSLog(@"element********b: %@", element);
                                                          NSLog(@"000");
                             Activity *at = [[Activity alloc] init];
                             //at = element;
                            // NSLog(@"activityID********b: %@",at.activityID);
                             NSLog(@"11111");
                             NSLog(@"2222");
                             
                             
                             
                           //  NSLog(@"%@",   )
                             NSLog(@"3333");
    
                             //NSLog(@"myDiper %@", element[@"diaperObject"][@"color"]);
                             NSLog(@"44444");*/
                             b = [[count objectAtIndex:i] intValue] + [feed[@"volume"] integerValue];
                             [count replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:b]];


                             
                         }
                         else if ([self.activityType isEqual: @"Sleep"])
                         {
                             PFObject *object =  element;
                             PFObject *sleep = [object objectForKey:@"sleepObject"];
                             NSLog(@"Sleep: %d",[sleep[@"endTime"] integerValue]);
                            b = [[count objectAtIndex:i] intValue] + ([sleep[@"endTime"] integerValue]-[element[@"timeStamp"] integerValue]);
                             NSLog(@"b: %d",b);
                             [count replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:b]];
                             
                         }
                         //[[count objectAtIndex:i] intValue] +1;
                         
                         
                         
                         
                         //NSLog(@"i = %d",i);
                         //NSLog(@"count = %@",[count objectAtIndex:i]);
                         
                       //  [counter replaceObjectAtIndex:i withObject:[count objectAtIndex:i]];
                         
                         
                         
                         
                     }
                 }
                 
                 x++;
                 if (element == [objects lastObject]) {
                     
                    // NSLog(@"***********HOPE : %@", hope);
                     
                     
                     for(int i=0;i<7;i++)
                         NSLog(@"count = %@",[count objectAtIndex:i]);
                     
                     NSMutableArray *mutableLineCharts = [NSMutableArray array];
                     for (int lineIndex=0; lineIndex<JBLineChartLineCount; lineIndex++)
                     {
                         NSMutableArray *mutableChartData = [NSMutableArray array];
                         
                         
                         ////////here you will insert the data
                         
                         for (int i=0; i<kJBLineChartViewControllerMaxNumChartPoints; i++)
                      {
                             
                             
                         [mutableChartData addObject:[count objectAtIndex:i]]; // random number between 0 and 1
                            // mutableChartData = counter;
                         //NSLog(counter[lineIndex]);
                      
                        }
                         [mutableLineCharts addObject:mutableChartData];
                     }
                     
                     _chartData = [NSArray arrayWithArray:mutableLineCharts];
                     _daysOfWeek =  dayweek;
                     [self.chartView reloadData];
                     
                 }
             }
             
             
             
             
             
         } else {
             NSString *errorString = [[error userInfo] objectForKey:@"error"];
             NSLog(@"Error: %@", errorString);
         }
         //         self.poopCounter.text =[@(counter) stringValue];
         
         
         
         
     }];
    
    //
    //    NSMutableArray *mutableLineCharts = [NSMutableArray array];
    //    for (int lineIndex=0; lineIndex<JBLineChartLineCount; lineIndex++)
    //    {
    //        NSMutableArray *mutableChartData = [NSMutableArray array];
    //
    //        ////////here you will insert the data
    //
    //        for (int i=0; i<kJBLineChartViewControllerMaxNumChartPoints; i++)
    //        {
    //            NSLog(@"here");
    //            [mutableChartData addObject:[NSNumber numberWithFloat:3+i]]; // random number between 0 and 1
    //
    //        }
    //        [mutableLineCharts addObject:mutableChartData];
    //    }
    //
    //    _chartData = [NSArray arrayWithArray:mutableLineCharts];
    //    _daysOfWeek = [[[NSDateFormatter alloc] init] shortWeekdaySymbols];
    //
    
    
    
}

- (NSArray *)largestLineData
{
    NSArray *largestLineData = nil;
    for (NSArray *lineData in self.chartData)
    {
        if ([lineData count] > [largestLineData count])
        {
           
            largestLineData = lineData;
            
        }
    }
    return largestLineData;
}

#pragma mark - View Lifecycle

- (void)loadView
{
    [super loadView];
    
    
    
    self.view.backgroundColor = kJBColorLineChartControllerBackground;
    self.navigationItem.rightBarButtonItem = [self chartToggleButtonWithTarget:self action:@selector(chartToggleButtonPressed:)];
    
    self.lineChartView = [[JBLineChartView alloc] init];
    self.lineChartView.frame = CGRectMake(kJBLineChartViewControllerChartPadding, kJBLineChartViewControllerChartPadding, self.view.bounds.size.width - (kJBLineChartViewControllerChartPadding * 2), kJBLineChartViewControllerChartHeight);
    self.lineChartView.delegate = self;
    self.lineChartView.dataSource = self;
    self.lineChartView.headerPadding = kJBLineChartViewControllerChartHeaderPadding;
    self.lineChartView.backgroundColor = kJBColorLineChartBackground;
    
    JBChartHeaderView *headerView = [[JBChartHeaderView alloc] initWithFrame:CGRectMake(kJBLineChartViewControllerChartPadding, ceil(self.view.bounds.size.height * 0.5) - ceil(kJBLineChartViewControllerChartHeaderHeight * 0.5), self.view.bounds.size.width - (kJBLineChartViewControllerChartPadding * 2), kJBLineChartViewControllerChartHeaderHeight)];
    
    
    headerView.titleLabel.text = [self.activityType stringByAppendingString:@" Report"];
    headerView.titleLabel.textColor = kJBColorLineChartHeader;
    headerView.titleLabel.shadowColor = [UIColor colorWithWhite:1.0 alpha:0.25];
    headerView.titleLabel.shadowOffset = CGSizeMake(0, 1);
    //headerView.subtitleLabel.text = kJBStringLabel2013;
    // headerView.subtitleLabel.textColor = kJBColorLineChartHeader;
    // headerView.subtitleLabel.shadowColor = [UIColor colorWithWhite:1.0 alpha:0.25];
    // headerView.subtitleLabel.shadowOffset = CGSizeMake(0, 1);
    headerView.separatorColor = kJBColorLineChartHeaderSeparatorColor;
    self.lineChartView.headerView = headerView;
    
    JBLineChartFooterView *footerView = [[JBLineChartFooterView alloc] initWithFrame:CGRectMake(kJBLineChartViewControllerChartPadding, ceil(self.view.bounds.size.height * 0.5) - ceil(kJBLineChartViewControllerChartFooterHeight * 0.5), self.view.bounds.size.width - (kJBLineChartViewControllerChartPadding * 2), kJBLineChartViewControllerChartFooterHeight)];
    footerView.backgroundColor = [UIColor clearColor];
    
    
    
    //// Changing the range of the y axes
    
    NSDate *today = [NSDate date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EE"];
    NSLog(@"%@", [dateFormatter stringFromDate:today]);
    
    NSDate *last = [today dateByAddingTimeInterval: -(86400.0*6)];
    NSLog(@"%@", [dateFormatter stringFromDate:last]);
    
    
    footerView.leftLabel.text = [[dateFormatter stringFromDate:last] uppercaseString];
    footerView.leftLabel.textColor = [UIColor whiteColor];
    footerView.rightLabel.text = @"TODAY";
    footerView.rightLabel.textColor = [UIColor whiteColor];
    
    /*footerView.leftLabel.text = [[self.daysOfWeek firstObject] uppercaseString];
     footerView.leftLabel.textColor = [UIColor whiteColor];
     footerView.rightLabel.text = [[self.daysOfWeek lastObject] uppercaseString];;
     footerView.rightLabel.textColor = [UIColor whiteColor];*/
    footerView.sectionCount = [[self largestLineData] count];
    self.lineChartView.footerView = footerView;
    
    [self.view addSubview:self.lineChartView];
    
    self.informationView = [[JBChartInformationView alloc] initWithFrame:CGRectMake(self.view.bounds.origin.x, CGRectGetMaxY(self.lineChartView.frame), self.view.bounds.size.width, self.view.bounds.size.height - CGRectGetMaxY(self.lineChartView.frame) - CGRectGetMaxY(self.navigationController.navigationBar.frame))];
    [self.informationView setValueAndUnitTextColor:[UIColor colorWithWhite:1.0 alpha:0.75]];
    [self.informationView setTitleTextColor:kJBColorLineChartHeader];
    [self.informationView setTextShadowColor:nil];
    [self.informationView setSeparatorColor:kJBColorLineChartHeaderSeparatorColor];
    [self.view addSubview:self.informationView];
    
    [self.lineChartView reloadData];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Close" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(closeButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(10, 600, 100, 50)];
    [self.view addSubview:button];
    [self.view bringSubviewToFront:self.toolBar];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.lineChartView setState:JBChartViewStateExpanded];
}

#pragma mark - JBChartViewDataSource

- (BOOL)shouldExtendSelectionViewIntoHeaderPaddingForChartView:(JBChartView *)chartView
{
    return YES;
}

- (BOOL)shouldExtendSelectionViewIntoFooterPaddingForChartView:(JBChartView *)chartView
{
    return NO;
}

#pragma mark - JBLineChartViewDataSource

- (NSUInteger)numberOfLinesInLineChartView:(JBLineChartView *)lineChartView
{
    return [self.chartData count];
}

- (NSUInteger)lineChartView:(JBLineChartView *)lineChartView numberOfVerticalValuesAtLineIndex:(NSUInteger)lineIndex
{
    return [[self.chartData objectAtIndex:lineIndex] count];
}

- (BOOL)lineChartView:(JBLineChartView *)lineChartView showsDotsForLineAtLineIndex:(NSUInteger)lineIndex
{
    return lineIndex == JBLineChartViewLineStyleDashed;
}

//- (BOOL)lineChartView:(JBLineChartView *)lineChartView smoothLineAtLineIndex:(NSUInteger)lineIndex
//{
   // return lineIndex == JBLineChartViewLineStyleSolid;
//}

#pragma mark - JBLineChartViewDelegate

- (CGFloat)lineChartView:(JBLineChartView *)lineChartView verticalValueForHorizontalIndex:(NSUInteger)horizontalIndex atLineIndex:(NSUInteger)lineIndex
{
    return [[[self.chartData objectAtIndex:lineIndex] objectAtIndex:horizontalIndex] floatValue];
}

- (void)lineChartView:(JBLineChartView *)lineChartView didSelectLineAtIndex:(NSUInteger)lineIndex horizontalIndex:(NSUInteger)horizontalIndex touchPoint:(CGPoint)touchPoint
{
    
    NSNumber *valueNumber = [[self.chartData objectAtIndex:lineIndex] objectAtIndex:horizontalIndex];
    NSString *unit;
    if ([self.activityType  isEqual: @"Diaper"])
    {
        unit = @" Diapers";
        [self.informationView setValueText:[NSString stringWithFormat:@"%.0f", [valueNumber floatValue]] unitText:unit];
    }
    else if ([self.activityType isEqual: @"Feed"])
    {
        unit = @" oz";
        [self.informationView setValueText:[NSString stringWithFormat:@"%.2f", [valueNumber floatValue]] unitText:unit];
    }
    else if ([self.activityType isEqual: @"Sleep"])
    {
        unit = @"";
        
        NSInteger hours = [valueNumber integerValue]/(60*60) ;
        NSLog(@"%d",hours);
        NSInteger minutes = ([valueNumber doubleValue]/(60*60)-hours)*60;
        NSLog(@"%d",minutes);
        
        NSString *duration = @"";
        
        if(hours!=0){
                duration =[duration stringByAppendingString:[NSString stringWithFormat:@"%02ld:", (long)hours]];
        }
        if(minutes!=0){
                duration =[duration stringByAppendingString:[NSString stringWithFormat:@"%02ld", (long)minutes]];
        }
        
        [self.informationView setValueText:duration  unitText:unit];
        
    }
    else
        unit = self.activityType;
        
    
        
   // [self.informationView setValueText:[NSString stringWithFormat:@"%.2f", [valueNumber floatValue]] unitText:unit];
    //[self.informationView setTitleText:lineIndex == JBLineChartLineSolid ? kJBStringLabelMetropolitanAverage : kJBStringLabelNationalAverage];
    [self.informationView setTitleText:@"Daily Total"];
    [self.informationView setHidden:NO animated:YES];
    [self setTooltipVisible:YES animated:YES atTouchPoint:touchPoint];
    [self.tooltipView setText:[[self.daysOfWeek objectAtIndex:horizontalIndex] uppercaseString]];
}

- (void)didDeselectLineInLineChartView:(JBLineChartView *)lineChartView
{
    [self.informationView setHidden:YES animated:YES];
    [self setTooltipVisible:NO animated:YES];
}

- (UIColor *)lineChartView:(JBLineChartView *)lineChartView colorForLineAtLineIndex:(NSUInteger)lineIndex
{
    return (lineIndex == JBLineChartLineSolid) ? kJBColorLineChartDefaultSolidLineColor: kJBColorLineChartDefaultDashedLineColor;
}

- (UIColor *)lineChartView:(JBLineChartView *)lineChartView colorForDotAtHorizontalIndex:(NSUInteger)horizontalIndex atLineIndex:(NSUInteger)lineIndex
{
    return (lineIndex == JBLineChartLineSolid) ? kJBColorLineChartDefaultSolidLineColor: kJBColorLineChartDefaultDashedLineColor;
}

- (CGFloat)lineChartView:(JBLineChartView *)lineChartView widthForLineAtLineIndex:(NSUInteger)lineIndex
{
    return (lineIndex == JBLineChartLineSolid) ? kJBLineChartViewControllerChartSolidLineWidth: kJBLineChartViewControllerChartDashedLineWidth;
}

- (CGFloat)lineChartView:(JBLineChartView *)lineChartView dotRadiusForDotAtHorizontalIndex:(NSUInteger)horizontalIndex atLineIndex:(NSUInteger)lineIndex
{
    return (lineIndex == JBLineChartLineSolid) ? 0.0: kJBLineChartViewControllerChartSolidLineDotRadius;
}

- (UIColor *)lineChartView:(JBLineChartView *)lineChartView verticalSelectionColorForLineAtLineIndex:(NSUInteger)lineIndex
{
    return [UIColor whiteColor];
}

- (UIColor *)lineChartView:(JBLineChartView *)lineChartView selectionColorForLineAtLineIndex:(NSUInteger)lineIndex
{
    return (lineIndex == JBLineChartLineSolid) ? kJBColorLineChartDefaultSolidSelectedLineColor: kJBColorLineChartDefaultDashedSelectedLineColor;
}

- (UIColor *)lineChartView:(JBLineChartView *)lineChartView selectionColorForDotAtHorizontalIndex:(NSUInteger)horizontalIndex atLineIndex:(NSUInteger)lineIndex
{
    return (lineIndex == JBLineChartLineSolid) ? kJBColorLineChartDefaultSolidSelectedLineColor: kJBColorLineChartDefaultDashedSelectedLineColor;
}

- (JBLineChartViewLineStyle)lineChartView:(JBLineChartView *)lineChartView lineStyleForLineAtLineIndex:(NSUInteger)lineIndex
{
    return (lineIndex == JBLineChartLineSolid) ? JBLineChartViewLineStyleSolid : JBLineChartViewLineStyleDashed;
}

#pragma mark - Buttons

- (void)chartToggleButtonPressed:(id)sender
{
    UIView *buttonImageView = [self.navigationItem.rightBarButtonItem valueForKey:kJBLineChartViewControllerNavButtonViewKey];
    buttonImageView.userInteractionEnabled = NO;
    
    CGAffineTransform transform = self.lineChartView.state == JBChartViewStateExpanded ? CGAffineTransformMakeRotation(M_PI) : CGAffineTransformMakeRotation(0);
    buttonImageView.transform = transform;
    
    [self.lineChartView setState:self.lineChartView.state == JBChartViewStateExpanded ? JBChartViewStateCollapsed : JBChartViewStateExpanded animated:YES callback:^{
        buttonImageView.userInteractionEnabled = YES;
    }];
}

#pragma mark - Overrides

- (JBChartView *)chartView
{
    return self.lineChartView;
}

#pragma mark - Setters

- (void)setTooltipVisible:(BOOL)tooltipVisible animated:(BOOL)animated atTouchPoint:(CGPoint)touchPoint
{
    _tooltipVisible = tooltipVisible;
    
    JBChartView *chartView = [self chartView];
    
    if (!chartView)
    {
        return;
    }
    
    if (!self.tooltipView)
    {
        self.tooltipView = [[JBChartTooltipView alloc] init];
        self.tooltipView.alpha = 0.0;
        [self.view addSubview:self.tooltipView];
    }
    
    [self.view bringSubviewToFront:self.tooltipView];
    
    if (!self.tooltipTipView)
    {
        self.tooltipTipView = [[JBChartTooltipTipView alloc] init];
        self.tooltipTipView.alpha = 0.0;
        [self.view addSubview:self.tooltipTipView];
    }
    
    [self.view bringSubviewToFront:self.tooltipTipView];
    
    dispatch_block_t adjustTooltipPosition = ^{
        CGPoint originalTouchPoint = [self.view convertPoint:touchPoint fromView:chartView];
        CGPoint convertedTouchPoint = originalTouchPoint; // modified
        JBChartView *chartView = [self chartView];
        if (chartView)
        {
            CGFloat minChartX = (chartView.frame.origin.x + ceil(self.tooltipView.frame.size.width * 0.5));
            if (convertedTouchPoint.x < minChartX)
            {
                convertedTouchPoint.x = minChartX;
            }
            CGFloat maxChartX = (chartView.frame.origin.x + chartView.frame.size.width - ceil(self.tooltipView.frame.size.width * 0.5));
            if (convertedTouchPoint.x > maxChartX)
            {
                convertedTouchPoint.x = maxChartX;
            }
            self.tooltipView.frame = CGRectMake(convertedTouchPoint.x - ceil(self.tooltipView.frame.size.width * 0.5), CGRectGetMaxY(chartView.headerView.frame), self.tooltipView.frame.size.width, self.tooltipView.frame.size.height);
            
            CGFloat minTipX = (chartView.frame.origin.x + self.tooltipTipView.frame.size.width);
            if (originalTouchPoint.x < minTipX)
            {
                originalTouchPoint.x = minTipX;
            }
            CGFloat maxTipX = (chartView.frame.origin.x + chartView.frame.size.width - self.tooltipTipView.frame.size.width);
            if (originalTouchPoint.x > maxTipX)
            {
                originalTouchPoint.x = maxTipX;
            }
            self.tooltipTipView.frame = CGRectMake(originalTouchPoint.x - ceil(self.tooltipTipView.frame.size.width * 0.5), CGRectGetMaxY(self.tooltipView.frame), self.tooltipTipView.frame.size.width, self.tooltipTipView.frame.size.height);
        }
    };
    
    dispatch_block_t adjustTooltipVisibility = ^{
        self.tooltipView.alpha = _tooltipVisible ? 1.0 : 0.0;
        self.tooltipTipView.alpha = _tooltipVisible ? 1.0 : 0.0;
    };
    
    if (tooltipVisible)
    {
        adjustTooltipPosition();
    }
    
    if (animated)
    {
        [UIView animateWithDuration:kJBBaseChartViewControllerAnimationDuration animations:^{
            adjustTooltipVisibility();
        } completion:^(BOOL finished) {
            if (!tooltipVisible)
            {
                adjustTooltipPosition();
            }
        }];
    }
    else
    {
        adjustTooltipVisibility();
    }
}

- (void)setTooltipVisible:(BOOL)tooltipVisible animated:(BOOL)animated
{
    [self setTooltipVisible:tooltipVisible animated:animated atTouchPoint:CGPointZero];
}

- (void)setTooltipVisible:(BOOL)tooltipVisible
{
    [self setTooltipVisible:tooltipVisible animated:NO];
}

#pragma mark - Getters

- (UIBarButtonItem *)chartToggleButtonWithTarget:(id)target action:(SEL)action
{
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:kJBImageIconArrow] style:UIBarButtonItemStylePlain target:target action:action];
    return button;
}

- (IBAction)closeButtonPressed {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
