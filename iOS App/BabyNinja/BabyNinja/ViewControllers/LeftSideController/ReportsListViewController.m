//
//  ReportsListViewController.m
//  BabyNinja
//
//  Created by Sneha on 2/28/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "ReportsListViewController.h"
#import "ReportScreenViewController.h"

@interface ReportsListViewController ()
@property(nonatomic, strong) NSArray *actions;
@end

@implementation ReportsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.actions = [[NSArray alloc] initWithObjects:@"Feed Report",@"Milk Report",@"Diaper Report","360 Report", nil];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.scrollEnabled = NO;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [self.actions objectAtIndex:indexPath.row];
    // Configure the cell...
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    return @"Reports";
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if([cell.textLabel.text isEqualToString:@"Milk Report"]){
        ReportScreenViewController *report = [[ReportScreenViewController alloc]init];
        [self presentViewController:report animated:YES completion:nil];
    }
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
