//
//  ReportListViewController.m
//  BabyNinja
//
//  Created by Sneha on 2/27/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "ReportListViewController.h"
#import "ReportScreenViewController.h"
#import "SleepReportViewController.h"

@interface ReportListViewController ()
@property(nonatomic, strong) NSArray *actions;
@end

@implementation ReportListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setBackgroundColor:[UIColor blackColor]];
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    self.actions = [[NSArray alloc] initWithObjects:@"Feed Report",@"Diaper Report",@"Sleep Report",@"360 Report", nil];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.scrollEnabled = NO;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.actions.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [self.actions objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    [cell setBackgroundColor:[UIColor clearColor]];
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if([cell.textLabel.text isEqualToString:@"Milk Report"]){
        ReportScreenViewController *report = [[ReportScreenViewController alloc]init];
        [self presentViewController:report animated:YES completion:nil];
    } else if([cell.textLabel.text isEqualToString:@"Sleep Report"]){
        SleepReportViewController *report = [[SleepReportViewController alloc]init];
        [self presentViewController:report animated:YES completion:nil];
    }else if([cell.textLabel.text isEqualToString:@"Feed Report"]){
        SleepReportViewController *report = [[SleepReportViewController alloc]init];
        
        [self presentViewController:report animated:YES completion:nil];
        report.imageView.image = [UIImage imageNamed:@"Feed"];
        report.header.text = @"The Feed Report";
    }else if([cell.textLabel.text isEqualToString:@"360 Report"]){
        SleepReportViewController *report = [[SleepReportViewController alloc]init];
        
        [self presentViewController:report animated:YES completion:nil];
        report.imageView.image = [UIImage imageNamed:@"360Report"];
        report.header.text = @"";
    }else if([cell.textLabel.text isEqualToString:@"Diaper Report"]){
        SleepReportViewController *report = [[SleepReportViewController alloc]init];
        
        [self presentViewController:report animated:YES completion:nil];
        report.imageView.image = [UIImage imageNamed:@"DiaperReport"];
        report.header.text = @"The Diaper Report";
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return @"Reports";
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
