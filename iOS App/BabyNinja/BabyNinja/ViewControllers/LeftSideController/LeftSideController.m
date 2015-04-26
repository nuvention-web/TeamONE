//
//  LeftSideController.m
//  BabyNinja
//
//  Created by Sneha on 2/3/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "LeftSideController.h"
#import "MainViewController.h"
#import "BabyProfileCell.h"
#import "CareTakersListCell.h"
#import "CustomTableFooter.h"
#import "SettingsTableViewController.h"
#import "ReportListViewController.h"
#import "TimelineViewController.h"

static NSString * const kICSColorsViewControllerCellReuseId = @"kICSColorsViewControllerCellReuseId";



@interface LeftSideController ()

@property(nonatomic, strong) CareTaker *careTaker;
@property(nonatomic, strong) NSArray *colors;
@property(nonatomic, assign) NSInteger previousRow;
@property(nonatomic, strong) NSArray *actions;
@property(nonatomic, strong) UITableView *tableView;

@end



@implementation LeftSideController

- (id)initWithColors:(NSArray *)colors
{
    NSParameterAssert(colors);
    self = [super init];
//    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        _colors = colors;
    }
    return self;
}

- (id)initWithCareTaker:(CareTaker*)careTaker
{
    self = [super init];
    
    //    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        _careTaker = careTaker;
    }
    
    return self;
}

#pragma mark - Managing the view

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 110, self.view.frame.size.height-40)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    self.actions = [[NSArray alloc] initWithObjects:@"Reports",@"Timeline",@"Settings", @"Logout", nil];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kICSColorsViewControllerCellReuseId];
    [self.tableView registerClass:[BabyProfileCell class] forCellReuseIdentifier:@"babyCell"];
    [self.tableView registerClass:[CareTakersListCell class] forCellReuseIdentifier:@"careTakerCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"BabyProfileCell" bundle:nil] forCellReuseIdentifier:@"babyCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CareTakersListCell" bundle:nil] forCellReuseIdentifier:@"careTakerCell"];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    CustomTableFooter *footer = [[CustomTableFooter alloc]init];
    footer.frame = CGRectMake(0, self.view.frame.size.height-40, self.view.frame.size.width, 40);
    [footer setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:footer];
    
    [self.tableView setBackgroundColor:[UIColor blackColor]];
//    self.tableView.tableFooterView = footer;

}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}
-(void)viewWillLayoutSubviews{

}
#pragma mark - Configuring the view’s layout behavior

- (UIStatusBarStyle)preferredStatusBarStyle
{
    // Even if this view controller hides the status bar, implementing this method is still needed to match the center view controller's
    // status bar style to avoid a flicker when the drawer is dragged and then left to open.
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==0){
        return 2;
    }else {
        return self.actions.count;
        //        return self.colors.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier;
    if (indexPath.section==0) {
        if (indexPath.row==0)
            cellIdentifier = @"babyCell";
        else
            cellIdentifier = @"careTakerCell";
    } else {
        cellIdentifier = kICSColorsViewControllerCellReuseId;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                                            forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if(indexPath.section==0){
        if(indexPath.row==0){
            BabyProfileCell *profileCell = (BabyProfileCell *)cell;
            profileCell.nameLabel.text = [(Baby*)[self.careTaker.careTakerBabyArray objectAtIndex:0] babyName];
            
            profileCell.ageLabel.text= [self calculateTheBabyAgeWithDOB:[(Baby*)[self.careTaker.careTakerBabyArray objectAtIndex:0] babyDOB]];

            
            
            [profileCell configureCell];
            
            return profileCell;
        } else {
            CareTakersListCell *profileCell = (CareTakersListCell *)cell;
            [profileCell configureCell];
            return profileCell;
        }
    } else {
        [cell setBackgroundView:[[UIImageView alloc]initWithImage:[UIImage imageNamed:[self.actions objectAtIndex:indexPath.row]]]];
//        NSParameterAssert(self.colors);
//        cell.textLabel.text = [self.actions objectAtIndex:indexPath.row];
//        //    cell.textLabel.text = [NSString stringWithFormat:@"Color %ld", (long)indexPath.row];
//        cell.textLabel.textColor = [UIColor whiteColor];
//        
//        cell.backgroundColor = self.colors[indexPath.row];
        
        return cell;
    }
}


-(NSString*)calculateTheBabyAgeWithDOB:(NSDate*)babyDOB{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *startDate = [(Baby*)[self.careTaker.careTakerBabyArray objectAtIndex:0] babyDOB];
    NSDate *endDate = [NSDate date];
    unsigned int unitFlags = NSCalendarUnitYear |NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:startDate  toDate:endDate  options:0];
    NSInteger years = [comps year];
    NSInteger months = [comps month];
    NSInteger days = [comps day];
    
    NSString *age = @"";
    
    if(years!=0){
        if(years == 1)
            age =[age stringByAppendingString:[NSString stringWithFormat:@"%ld year ", (long)years]];
        else
            age =[age stringByAppendingString:[NSString stringWithFormat:@"%ld years ", (long)years]];
    }
    if(months!=0){
        if(months == 1)
            age =[age stringByAppendingString:[NSString stringWithFormat:@"%ld month ", (long)months]];
        else
            age =[age stringByAppendingString:[NSString stringWithFormat:@"%ld months ", (long)months]];
    }
    if(days!=0){
        if(days == 1)
            age =[age stringByAppendingString:[NSString stringWithFormat:@"%ld day", (long)days]];
        else
            age =[age stringByAppendingString:[NSString stringWithFormat:@"%ld days", (long)days]];
    }
    
    return age;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 1){
        if(indexPath.row==2){
            SettingsTableViewController *settings = [[SettingsTableViewController alloc]init];
            [self.navigationController pushViewController:settings animated:YES];
        } else if(indexPath.row==0){
            ReportListViewController *reports = [[ReportListViewController alloc]init];
            [self.navigationController pushViewController:reports animated:YES];
        } else if(indexPath.row==1){
            TimelineViewController *timeline = [[TimelineViewController alloc]init];
            [self presentViewController:timeline animated:YES completion:nil];
        } else if(indexPath.row ==3){
            [[NSNotificationCenter defaultCenter] postNotificationName:ULogoutNotification object:nil];
            [self.drawer close];
        }
    }
    
    //    if (indexPath.row == self.previousRow) {
    //        // Close the drawer without no further actions on the center view controller
    //        [self.drawer close];
    //    }
    //    else {
    //        // Reload the current center view controller and update its background color
    //        typeof(self) __weak weakSelf = self;
    //        [self.drawer reloadCenterViewControllerUsingBlock:^(){
    //            NSParameterAssert(weakSelf.colors);
    //            weakSelf.drawer.centerViewController.view.backgroundColor = weakSelf.colors[indexPath.row];
    //        }];
    //
    //        //        // Replace the current center view controller with a new one
    //        //        ICSPlainColorViewController *center = [[ICSPlainColorViewController alloc] init];
    //        //        center.view.backgroundColor = [UIColor redColor];
    //        //        [self.drawer replaceCenterViewControllerWithViewController:center];
    //    }
    //    self.previousRow = indexPath.row;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0 && indexPath.row ==0)
        return 160;
    else if (indexPath.section==0 && indexPath.row ==1)
        return 90;
    else
        return 64;
}

#pragma mark - ICSDrawerControllerPresenting

- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

- (void)drawerControllerWillClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

@end
